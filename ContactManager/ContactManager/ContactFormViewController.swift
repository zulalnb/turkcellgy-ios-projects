//
//  ContactFormViewController.swift
//  ContactManagerCoreData
//
//  Created by Zülal Nebin on 9.11.2026.
//

import UIKit
import CoreData

class ContactFormViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var contactId: NSManagedObjectID?
    private var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let contactId {
            fetchContactById(id: contactId)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let firstName = firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let lastName = lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        // Check required fields
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty else {
            showAlert(
                title: "Eksik Bilgi",
                message: "Lütfen tüm alanları doldurun."
            )
            return
        }
        
        // Validate email format
        guard isValidEmail(email) else {
            showAlert(
                title: "Geçersiz E-posta",
                message: "Lütfen geçerli bir e-posta adresi girin."
            )
            return
        }
        
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer
            .viewContext
        
        do {
            // Check email uniqueness
            guard try !isEmailAlreadyUsed(email) else {
                showAlert(
                    title: "E-posta Kullanılıyor",
                    message: "Bu e-posta adresi başka bir kişiye ait."
                )
                return
            }
            
            if let contact {
                // Update existing contact
                contact.firstName = firstName
                contact.lastName = lastName
                contact.email = email
            } else {
                // Create new contact
                let entity = NSEntityDescription.entity(
                    forEntityName: "Contact",
                    in: context
                )!
                
                let newContact = NSManagedObject(
                    entity: entity,
                    insertInto: context
                )
                
                newContact.setValue(firstName, forKey: "firstName")
                newContact.setValue(lastName, forKey: "lastName")
                newContact.setValue(email, forKey: "email")
            }
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            dismiss(animated: true)
            
        } catch {
            showAlert(
                title: "Hata",
                message: "Kişi kaydedilirken bir hata oluştu."
            )
            print("Failed to save contact: \(error.localizedDescription)")
        }
    }
    
    func fetchContactById(id: NSManagedObjectID) {
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer
            .viewContext
        
        
        do {
            contact = try context.existingObject(with: id) as? Contact
            
            firstNameTextField.text = contact?.firstName
            lastNameTextField.text = contact?.lastName
            emailTextField.text = contact?.email
            
        } catch {
            print("Failed to fetch contact: \(error.localizedDescription)")
        }
    }
    
    private func isEmailAlreadyUsed(_ email: String) throws -> Bool {
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer
            .viewContext
        
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(
            format: "email ==[c] %@",
            email
        )
        
        let results = try context.fetch(fetchRequest)
        
        return results.contains { $0.objectID != contact?.objectID }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let pattern = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
        
        return email.wholeMatch(of: pattern) != nil
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(title: "Tamam", style: .default)
        )
        
        present(alert, animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
