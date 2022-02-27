//
//  LoginViewController.swift
//  instagram
//
//  Created by Eva Keeling on 2/26/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground:username, password:password) {
          (user: PFUser?, error: Error?) -> Void in
          if user != nil {
              self.performSegue(withIdentifier: "loginSegue", sender: nil)
              print("The user has logged in!")
          } else {
            // The login failed. Check error to see why.
              print("There was an error logging the user in!")
              print(error ?? "Unknown error.")
          }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        user.signUpInBackground { (success, error) in
            if (success) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("The user was signed up!")
            } else {
                print("There was an error signing the user up!")
                print(error ?? "Unknown error.")
            }
        }
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
