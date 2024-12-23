//
//  APICaller.swift
//  CelebSearch
//
//  Created by Rakesh Kumar on 23/12/24.
//

import Foundation

protocol APICallerDelegate: AnyObject {
    func fetchPopularPerson(with list: [PersonResults], fromSearch: Bool)
}

struct APICaller {
    weak var delegate: APICallerDelegate?
    
    func getCelebData(pages: Int) {
        
        guard let url = URL(string: "\(AppConstants.baseURL)/3/person/popular?api_key=\(AppConstants.API_KEY)&page=\(pages)") else {
            print("DEBUG: Error in fetching Endpoint")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("DEBUG: Error in fetching Data")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PersonModel.self, from: data)
                DispatchQueue.main.async {
                    self.delegate?.fetchPopularPerson(with: result.results, fromSearch: false)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func searchCelebData(query: String) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        guard let url = URL(string: "\(AppConstants.baseURL)/3/search/person?api_key=\(AppConstants.API_KEY)&query=\(query)") else {
            print("DEBUG: Error in fetching Endpoint")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("DEBUG: Error in fetching Data")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PersonModel.self, from: data)
                DispatchQueue.main.async {
                    self.delegate?.fetchPopularPerson(with: result.results, fromSearch: true)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func personProfileData(id: Int, completion: @escaping (Result<PersonBioModel, Error>) -> ()) {
        guard let url = URL(string: "\(AppConstants.baseURL)/3/person/\(id)?api_key=\(AppConstants.API_KEY)") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(PersonBioModel.self, from: data)
                completion(.success(result))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
