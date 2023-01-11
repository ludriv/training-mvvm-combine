import UIKit

class CounterViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    private let viewModel: CounterViewModelProtocol = CounterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.countText.bind = { [weak self] countText in
            DispatchQueue.main.async {
                self?.countLabel.text = countText
            }
        }
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        viewModel.onMinusButtonTap()
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        viewModel.onPlusButtonTap()
    }
    
    @IBAction func randomButtonTapped(_ sender: Any) {
        viewModel.onRandomButtonTap()
    }
}
