# frozen_string_literal: true

require_relative 'spec_helper'

describe StatisticsApp do
  describe '#run' do
    let(:csv) { StatisticsApp.new(File.join(File.dirname(__FILE__), 'files', 'data.csv')).run }
    let(:json) { StatisticsApp.new(File.join(File.dirname(__FILE__), 'files', 'data.json')).run }

    it 'return type Hash' do
      expect(csv.class).to eq(Hash)
      expect(json.class).to eq(Hash)
    end

    it 'return correct values from csv file' do
      expect(csv[:distribution_of_the_number_of_fellow_passenger_per_user]).to eq(3)
      expect(csv[:the_average_compensation_per_passenger]).to eq(44.0)
      expect(csv[:the_most_popular_airline_chosen_by_passengers]).to eq('AHT')
      expect(csv[:the_percentage_of_users_who_got_compensation]).to eq(75.0)
    end

    it 'return correct values from json file' do
      expect(json[:distribution_of_the_number_of_fellow_passenger_per_user]).to eq(2)
      expect(json[:the_average_compensation_per_passenger]).to eq(61.5)
      expect(json[:the_most_popular_airline_chosen_by_passengers]).to eq('PID')
      expect(json[:the_percentage_of_users_who_got_compensation]).to eq(75.0)
    end
  end
end
