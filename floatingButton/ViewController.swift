//
//  ViewController.swift
//  floatingButton
//
//  Created by mizoz on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {
    // let button = UIButton()  デフォルト設定の UIButton を button として定義
    // let button = UIButton{}()    カスタム設定の UIButton を button として定義
    private let floatingButton: UIButton = {    // 「floatingButton は UIButton（｛｝内で設定しカスタムしたもの）です」と宣言
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)) // button = UIButton（位置＆大きさカスタムしたもの）として定義

        button.layer.cornerRadius = 30  // 60 / 2 （正円）
        button.backgroundColor = .systemPink
//        button.layer.masksToBounds = true   // buttonをはみ出した部分は描画しない
        button.layer.shadowRadius = 10  // ＊button自体の丸み具合より小さくないと影が見えない
        button.layer.shadowOpacity = 0.3
        
        // image（UIImage）の種類、大きさ、太さ
        let image = UIImage(
            systemName: "plus", // 種類
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium)  // 大きさ、太さ
        )
        button.setImage(image, for: .normal)    // 何もしていないとき image を表示する
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        
        return button   // floatingButtonは、この中で設定した"button"を UIButton として返す
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingButton) // floatingButton（上記で定義）をviewに追加
        // targetはなにか、呼ぶ関数はなにか、なにを以て行うか
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // floatingButtonの位置＆大きさ（buttonの設定は上書きされる）
        floatingButton.frame = CGRect(
            x: view.frame.size.width - 60 - 8,  // -8 : mergin
            y: view.frame.size.height - 60 - 8 - view.safeAreaInsets.bottom,
            width: 60,
            height: 60
        )
    }
    
    
    // floatingButton押下時に呼ばれる関数
    @objc private func didTapButton() {
        let alert = UIAlertController(
            title: "Add Someting",
            message: "Floating button tapped",
            preferredStyle: .alert  // ポップアップを出すタイプ
        )
        // どういうアクションをするか具体的に設定
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))  // cancelのスタイル
        present(alert, animated: true)  // アニメーションあり
    }

}

