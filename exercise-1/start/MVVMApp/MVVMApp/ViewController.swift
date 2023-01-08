import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    let numberService: NumberServiceProtocol = NumberService()
    
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        count -= 1
        countLabel.text = "\(count)"
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        count += 1
        countLabel.text = "\(count)"
    }
    
    @IBAction func randomButtonTapped(_ sender: Any) {
        numberService.getRandomNumber { [weak self] result in
            switch result {
            case .success(let randomNumber):
                self?.count = randomNumber
                DispatchQueue.main.async {
                    self?.countLabel.text = "\(randomNumber)"
                }
            case .failure:
                break
            }
        }
    }
}
