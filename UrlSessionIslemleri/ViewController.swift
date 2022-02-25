//
//  ViewController.swift
//  UrlSessionIslemleri
//
//  Created by Berat Yavuz on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        kisiEkle()
//        kisiSil()
//        kisiGuncelle()
//        tumKisiler()
//        aramaYap()
    }
    func kisiEkle(){
    
        var request = URLRequest(url:URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
      //post işlemi yapıcaz
        request.httpMethod = "POST"
        
        //web serviste kisi ad kısmına
        let postString = "kisi_ad=TESTad&kisi_tel=TESTtel"
    
        //turkceye uyumluluk için utf8
        request.httpBody = postString.data(using:.utf8)
        
        URLSession.shared.dataTask(with: request) {(data,response,error)in
            
            if error != nil || data == nil{
                print("hata var")
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
            }
            
            catch{print(error.localizedDescription)}
            
        }.resume()
    }
    func kisiSil(){
        
        // web servisine request yapıyoruz
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=4639"
        
        //request ve yukarıdaki işlemi birleştirme
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            if error != nil || data == nil{print("hata")
                return
            }
            do
            {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
                 }
            
            catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }

    
    func kisiGuncelle(){
        
        // web servisine request yapıyoruz
        
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=4638&kisi_ad=berat&kisi_tel=0000"
        
        //request ve yukarıdaki işlemi birleştirme
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            if error != nil || data == nil{print("hata")
                return
            }
            do
            {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                    print(json)
                }
                 }
            
            catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }

    //kisileriAlma
    
    func tumKisiler(){
        
       let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        URLSession.shared.dataTask(with:url){(data,response,error)in
            
            if error != nil || data == nil{
                print("hata")
            }
                
                do{
                  if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                        print(json)
                    }
                }
                catch{
                    
                    print(error.localizedDescription)
                }
                
            
        }.resume()
        
        
        
    }

//arama yap func
    
    func aramaYap(){
       var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        
        request.httpMethod = "POST"
        
        let postString = "kisi_ad=x"
        
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with:request){(data,response,error)in
            
            if error != nil || data == nil{
                print("hata")
            }
                
                do{
                  if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]{
                        print(json)
                    }
                }
                catch{
                    
                    print(error.localizedDescription)
                }
                
            
        }.resume()
        
        
        
    }
    
    

}

