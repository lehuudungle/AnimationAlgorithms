import UIKit
import KDPulseButton

class ShareVC: UIViewController {
    
    var btnShare: UIButton!
    var imgLogo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addShare()
        addLogo()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addShare(){
        btnShare = KDPulseButton(frame: CGRect(x: view.bounds.size.width/5, y: view.bounds.size.height-200, width: view.bounds.size.width*3/5, height: 50))
        btnShare.backgroundColor = UIColor.green
        btnShare.setTitle("Share", for: .normal)
        btnShare.layer.cornerRadius = 10
        btnShare.addTarget(self, action: #selector(share(sender:)), for: .touchUpInside )
        view.addSubview(btnShare)
    }
    func addLogo(){
        let image = UIImage(named: "Clouse")
        imgLogo = UIImageView(image: image)
        imgLogo.frame = CGRect(x: view.bounds.size.width/5, y: view.bounds.size.height/5, width: view.bounds.size.width*3/5, height: view.bounds.size.height/3)
        view.addSubview(imgLogo)
    }
    
    func share(sender: UIButton){
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
}
