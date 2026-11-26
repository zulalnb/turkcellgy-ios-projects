
//
//  ViewController.swift
//  ContactManager
//
//  Created by Zülal Nebin on 5.11.2026.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    /*
     Giriş ekranında kişi listesi bulunacak.
     Ekranın sağ üst köşesindeki + butonuna basıldığında yeni kişi ekleme sayfası açılacak.
     Yeni ekleme sayfasında kişilerin ad, soyad, eposta bilgileri alınacak ve kaydet butonuna basıldığında bilgiler veritabanına kaydedilecek.
     Kayıt işlemi sonrası giriş ekranına geri dönülecek ve yeni kişi listeye eklenecek.
     Listede veriler alfabetik olarak sıralı gelecek.
     Listedeki elemana basıldığında düzenleme ekranına gidilecek ve kişiler güncellenecek.
     Düzenleme ekranı yeni ekleme ekranı ile aynı tasarıma sahip olacak.
     Listedeki eleman sola çekildiğinde silinebilecek.
     */

    @IBOutlet weak var contactsTableView: UITableView!

    var contacts: [Contact] = []

    // Pagination
    private let pageSize = 20
    private var currentPage = 0
    private var isLoading = false
    private var hasMoreData = true

    // Core Data context
    private var context: NSManagedObjectContext {
        (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer
            .viewContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Refresh list after adding or editing a contact
        fetchContacts(isRefreshing: true)
    }

    // MARK: - UITableViewDataSource

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        contacts.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {

        let cell = UITableViewCell()
        let contact = contacts[indexPath.row]

        cell.textLabel?.text =
            "\(contact.firstName ?? "") \(contact.lastName ?? "")"

        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(
            withIdentifier: "sgEditContact",
            sender: contacts[indexPath.row].objectID
        )
    }

    // MARK: - Navigation

    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier == "sgEditContact" {
            let destinationViewController =
                segue.destination as! ContactFormViewController

            destinationViewController.contactId =
                sender as? NSManagedObjectID
        }
    }

    // MARK: - Delete Contact

    func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle == .delete {

            let contactToDelete = contacts[indexPath.row]

            let alert = UIAlertController(
                title: "Kişiyi Sil",
                message: "Bu kişiyi silmek istediğinizden emin misiniz?",
                preferredStyle: .alert
            )

            alert.addAction(
                UIAlertAction(title: "Vazgeç", style: .cancel)
            )

            alert.addAction(
                UIAlertAction(title: "Sil", style: .destructive) { _ in

                    self.context.delete(contactToDelete)

                    (UIApplication.shared.delegate as! AppDelegate)
                        .saveContext()

                    self.fetchContacts(isRefreshing: true)
                }
            )

            present(alert, animated: true)
        }
    }

    // MARK: - Pagination

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.height
        let offsetY = scrollView.contentOffset.y

        // Load next page when approaching the bottom
        if offsetY > contentHeight - scrollViewHeight * 1.5 {
            fetchContacts()
        }
    }

    // MARK: - Fetch Contacts

    func fetchContacts(isRefreshing: Bool = false) {

        guard !isLoading else { return }

        if isRefreshing {
            currentPage = 0
            hasMoreData = true
            contacts.removeAll()
            contactsTableView.reloadData()
        }

        guard hasMoreData else { return }

        isLoading = true

        let fetchRequest: NSFetchRequest<Contact> =
            Contact.fetchRequest()

        // Sort contacts alphabetically
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "firstName", ascending: true),
            NSSortDescriptor(key: "lastName", ascending: true)
        ]

        // Pagination
        fetchRequest.fetchLimit = pageSize
        fetchRequest.fetchOffset = currentPage * pageSize

        do {
            let fetchedContacts = try context.fetch(fetchRequest)

            contacts.append(contentsOf: fetchedContacts)

            currentPage += 1

            // Stop pagination when no more records are available
            hasMoreData = fetchedContacts.count == pageSize

            contactsTableView.reloadData()

        } catch {
            print(
                "Failed to fetch contacts: \(error.localizedDescription)"
            )
        }

        isLoading = false
    }

    // MARK: - Test Data

    // Call this method once to create 100 test contacts.
    // Do not call it every time the application launches.

    func createTestContacts() {

        for index in 1...100 {

            let contact = Contact(context: context)

            contact.firstName = "Contact \(index)"
            contact.lastName = "Test"
            contact.email = "contact\(index)@example.com"
        }

        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        fetchContacts(isRefreshing: true)
    }
}
