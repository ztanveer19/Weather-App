//
//  ContentView.swift
//  Weather
//
//  Created by Zeeshan Tanveer on 2022-06-12.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView_(weather: weather)
                } else{
                    LoadingView()
                        .task {
                            do{
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                                
                            }catch {
                                print("Error getting weather:\(error)")
                            }
                        }
                }
                
            } else {
                if locationManager.isLoading{
                    LoadingView()
                } else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
   
        }
        .background(Color(hue: 0.539, saturation: 0.791, brightness: 0.904))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
