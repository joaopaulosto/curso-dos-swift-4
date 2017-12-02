//
//  DataGenerator.swift
//  DataKit
//
//  Created by João Paulo Scopus on 29/11/2017.
//  Copyright © 2017 João Paulo Scopus. All rights reserved.
//

import Foundation

public func printHelloWord(){
    print("Hellow Word")
}

public func createInstances(numberOfInstance: Int) -> [Icon]{
    var listIcons = [Icon]()
    for _ in 0..<numberOfInstance{
        let icon = Icon(name: randomIconName(), imageName: randomIconName(), description: randomIconName())
        listIcons.append(icon)
    }
    return listIcons
}

public func generationIcons(maxSection: Int, maxRow: Int) -> [Int : [Icon]]{
    var dict = [Int: [Icon]]()
    
    for i in 0..<maxSection {
        var icons = [Icon]()
        for _ in 0..<maxRow {
            let iconName = randomIconName()
            let icon = Icon(name: iconName, imageName: iconName, description: randomDilmaDescription())
            icons.append(icon)
        }
        dict[i] = icons
    }
    return dict
}

open class Icon {
    public let name: String
    public let imageName: String
    public let description: String
    
    public init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
    }
}

open class NetworkImage {
    public let name: String
    public let link: String
    public let description: String
    
    public init(name: String, link: String, description: String) {
        self.name = name
        self.link = link
        self.description = description
    }
}

fileprivate func randomDilmaDescription() -> String {
    let strs = [
        "A única área que eu acho, que vai exigir muita atenção nossa, e aí eu já aventei a hipótese de até criar um ministério.",
        "É na área de... Na área... Eu diria assim, como uma espécie de analogia com o que acontece na área agrícola.",
        "Todos as descrições das pessoas são sobre a humanidade do atendimento, a pessoa pega no pulso, examina, olha com carinho.",
        "Então eu acho que vai ter outra coisa, que os médicos cubanos trouxeram pro brasil, um alto grau de humanidade.",
        "Primeiro eu queria cumprimentar os internautas. -Oi Internautas! Depois dizer que o meio ambiente é sem dúvida nenhuma uma ameaça ao desenvolvimento sustentável.",
        "E isso significa que é uma ameaça pro futuro do nosso planeta e dos nossos países. O desemprego beira 20%, ou seja, 1 em cada 4 portugueses.",
        "Eu dou dinheiro pra minha filha. Eu dou dinheiro pra ela viajar, então é... é... Já vivi muito sem dinheiro, já vivi muito com dinheiro.",
        "-Jornalista: Coloca esse dinheiro na poupança que a senhora ganha R$10 mil por mês. -Dilma: O que que é R$10 mil?"
    ]
    let r = arc4random_uniform(UInt32(strs.count))
    return strs[Int(r)]
}

fileprivate func randomIconName() -> String {
    let strs = [
        "AirPlay Icon",
        "Back",
        "Cancel",
        "Chevron",
        "Edit",
        "For You Copy",
        "Location",
        "Plus",
        "Rectangle 1306",
        "Search Icon",
        "Selected",
        "Shape",
        "Share"
    ]
    let r = arc4random_uniform(UInt32(strs.count))
    return strs[Int(r)]
}

fileprivate func randomImageUrl() -> String {
    return "https://picsum.photos/\(arc4random_uniform(900) + 100)/?random"
}

public func normalizedRandom() -> Double {
    
    return Double(arc4random_uniform(UInt32.max)) / Double(UInt32.max)
}

extension UIImageView{
   public func downloadImage(url: URL){
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        self.image = UIImage(data: data)
    }
    public func downloadImageAsync(url: URL){
        URLSession.shared.dataTask(with: url, completionHandler:
            { (data, response, error) -> Void in
                
            if error != nil {
                print(error ?? "Error in imageFormServerURL")
            }
            DispatchQueue.main.sync(execute: { [weak self] () -> Void in
                let image = UIImage(data: data!)
                self?.image = image
            })
        }).resume()
    }
    
    func downloadImageAsync2(url: URL){
        URLSession.shared.dataTask(with: url, completionHandler: { [weak self]
            (data, response, error) in
            
            guard error != nil else {
                print(error ?? "Erro ao fazer  download da Imagem.")
                return
            }
            DispatchQueue.main.async { [weak self] in
                let image = UIImage(data: data!)
                self?.image = image
            }
        }).resume()
    }
}


public func geradorImagens(maxSections: Int, maxRows: Int) -> [Int:[NetworkImage]] {
    var dict = [Int:[NetworkImage]]()
    
    for i in 0..<maxSections {
        var networksImage = [NetworkImage]()
        for _ in 0..<maxRows{
            let imageName = randomIconName()
            let netWorkImage = NetworkImage(name: imageName, link: randomImageUrl(), description: randomDilmaDescription())
            networksImage.append(netWorkImage)
        }
        dict[i] = networksImage
    }
    return dict
}


