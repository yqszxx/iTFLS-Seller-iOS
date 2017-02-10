//
//  ScanCodeViewController.swift
//  iTFLS Seller
//
//  Created by x5 on 17/2/8.
//  Copyright © 2017年 yqszxx. All rights reserved.
//

import UIKit
import AVFoundation

class ScanCodeViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var session: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        session = AVCaptureSession()
        let videoCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        let videoInput: AVCaptureDeviceInput!
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if (session.canAddInput(videoInput)) {
            session.addInput(videoInput)
        } else {
            scanningNotPossible()
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        if (session.canAddOutput(metadataOutput)) {
            session.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [AVMetadataObjectTypeCode128Code]
        } else {
            scanningNotPossible()
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)!
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        view.layer.addSublayer(previewLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (session.isRunning == false) {
            session.startRunning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (session.isRunning == true) {
            session.stopRunning()
        }
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        if let barcodeData = metadataObjects.first {
            let barcodeReadable = barcodeData as? AVMetadataMachineReadableCodeObject
            if let readableBarcode = barcodeReadable {
                handleCode(code: readableBarcode.stringValue)
            }
        }
        session.stopRunning()
    }
    
    func scanningNotPossible() {
        let alert = UIAlertController(title: "Can't scan", message: "Check your configs about camera!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        session = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Custom Logic
    func handleCode(code: String) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
