//
//  ViewController.swift
//  UISlider
//
//  Created by Sergey Lavrov on 24.05.2020.
//  Copyright © 2020 +1. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Outlet
    @IBOutlet weak var volume: UISlider!
    @IBOutlet weak var play: UIButton!
    
    //MARK: - Var
    var audioSession = AVAudioSession.sharedInstance()
    var player = AVAudioPlayer()
    var slider = UISlider()
    var isPlayed = false

    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Добавление слайдера для перемещения по музыкальному файлу
        slider.frame = CGRect(x: 0, y: 0, width: view.frame.width - 40, height: 23)
        slider.center = view.center
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.addTarget(self, action: #selector(changeSlider(sender:)), for: .valueChanged)
        view.addSubview(slider)

        // Подключаем проигрывание файла happy.mp3
        do {
            if let audioPath = Bundle.main.path(forResource: "happy", ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
                setVolumeSlider(systemVolume: audioSession.outputVolume)
            }
        } catch {
            print("Ошибка при попытке воспроизведения музыки")
        }
        playButton(play)
    }
        
    //MARK: - Method
    // Перемещение по музыкальному файлу
    @objc func changeSlider(sender: UISlider){
        if (sender == slider) {
            player.pause()
            player.currentTime = TimeInterval(sender.value)
            if isPlayed {
                player.play()
            }
        }
    }
    
    // Установка параметров слайдера управления звуком
    func setVolumeSlider(systemVolume: Float){
        volume.minimumValue = 0.0
        if (audioSession.outputVolume > 0 && player.volume > 0){
            volume.maximumValue = systemVolume / player.volume
        } else {
            volume.maximumValue = 1.0
        }
        volume.value = volume.maximumValue * systemVolume * player.volume
        print(systemVolume)
    }

    //MARK: - Action
    // Запуск проигрывания файла
    @IBAction func playButton(_ sender: UIButton) {
        isPlayed = !isPlayed
        if isPlayed {
            play.setTitle("Остановить", for: .normal)
            player.play()
        } else {
            play.setTitle("Играть", for: .normal)
            player.pause()
        }
    }

    // Изменение громкости
    @IBAction func volumeSlider(_ sender: UISlider) {
        player.volume = volume.value / volume.maximumValue
    }
}

