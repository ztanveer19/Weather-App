//
//  WeatherView .swift
//  Weather
//
//  Created by Zeeshan Tanveer on 2022-06-17.
//

import SwiftUI

struct WeatherView_: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.name)
                        .bold().font(.title)
                    
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment:  .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20){
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()

                        Text(weather.main.feelsLike .roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                Spacer()
                    
                .frame(height: 80)
                
                AsyncImage(url: URL(string:"https://img.freepik.com/free-vector/cartoon-city-landscape_52683-69416.jpg?w=2000&t=st=1656720947~exp=1656721547~hmac=88a3b68936823263d063a3597d34a6230a8175366c5bd5aeb6420c56b3bf6472")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                } placeholder: {
                    ProgressView()
                }
                
                Spacer()
                    
                }
            .frame(maxWidth: .infinity, alignment: .trailing)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
                
            VStack{
                Spacer()
                
                VStack(alignment: .leading, spacing:20){
                    Text("Weather now")
                        .bold().padding(.bottom)
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                        
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                        
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.539, saturation: 0.791, brightness: 0.904))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])

            }
        }
            
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.539, saturation: 0.791, brightness: 0.904))
        .preferredColorScheme(.dark)
        
    }
}

struct WeatherView__Previews: PreviewProvider {
    static var previews: some View {
        WeatherView_(weather: previewWeather)
    }
}





