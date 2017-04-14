import UIKit

class ShareVC: UIViewController {
    
    var btnShare: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addShare()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addShare(){
        btnShare = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        btnShare.backgroundColor = UIColor.green
        btnShare.setTitle("Share", for: .normal)
        btnShare.addTarget(self, action: #selector(share(sender:)), for: .touchUpInside )
        view.addSubview(btnShare)
    }
    
    func share(sender: UIButton){
        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        
        self.present(activityVC, animated: true, completion: nil)
    }
    
}
