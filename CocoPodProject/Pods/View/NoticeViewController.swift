//
//  NoticeViewController.swift
//  Pods-CocoPodProject
//
//  Created by Admin on 14/04/2022.
//

import Foundation

class NoticeViewController: UIViewController {
    
    var presenter:ViewToPresenterProtocol?
    @IBOutlet weak var uiTableView: UITableView!
    var noticeArrayList:Array<NoticeModel> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Notice-Module"
        presenter?.startFetchingNotice()
        showProgressIndicator(View: self.view)
        
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }
}

extension NoticeViewController:PresenterToViewProtocol{
    func showNotice(noticeArray: Array<NoticeModel>) {
        self.noticeArrayList = noticeArray
        self.uiTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func showError() {
        
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert",message: "Problem Fetching Notice",preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "okay", style: UIAlertActionStyle.default, handler: nil))
        self.presenter(alert, animation: true, completion: nil)
    }
}

extension NoticeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsinSection selection: Int) -> Int {
        return noticeArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoticeCell
        cell.id.text = noticeArrayList[indexPath.row].id
        cell.title.text = noticeArrayList[indexPath.row].title
        cell.brief.text = noticeArrayList[indexPath.row].brief
        cell.file_source.text = noticeArrayList[indexPath.row].filesource
        
        return cell
}
    func tableView(_ tableView: UITableView, didselectRowAt indexPath: IndexPath)  {
        presenter?.showMovieController(navigationController: navigationController)
    }
}

class NoticeCell:UITableViewCell{
    
    @IBOutlet week var id: UILabel!
    @IBOutlet week var title: UILabel!
    @IBOutlet week var brief: UILabel!
    @IBOutlet week var filesource: UILabel!
}































































