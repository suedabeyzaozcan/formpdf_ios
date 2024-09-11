//
//  ViewController.swift
//  formPdf
//
//  Created by Sueda Beyza Özcan on 11.09.2024.
//
import UIKit
import PDFKit

class ViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pdfView = PDFView(frame: CGRect(x: 20, y: 50, width: self.view.frame.width - 40, height: 500))
        if let pdfURL = Bundle.main.url(forResource: "Form", withExtension: "pdf"),
           let pdfDocument = PDFDocument(url: pdfURL) {
            pdfView.document = pdfDocument
            pdfView.autoScales = true
            self.view.addSubview(pdfView)
        }
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        printFormData()
    }

    func printFormData() {
        if let pdfDocument = pdfView.document {
            // döngüyle gez
            for i in 0..<pdfDocument.pageCount {
                if let page = pdfDocument.page(at: i) {

                    for annotation in page.annotations {
                        annotation.widgetStringValue = "3"
                        print("Field: \(annotation.fieldName ?? "Unnamed Field") - Value: \(annotation.widgetStringValue)","values",annotation.values,"annotationKeyValues",annotation.annotationKeyValues,"widgetDefaultStringValue",annotation.widgetDefaultStringValue)
                        if let widget = annotation.widgetStringValue {
                            
                           
                        }
                        
                    }
                }
            }
        }
    }
}
