# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/spec_helper'

def app
  @app ||= Sinatra::Application
end

describe 'Sooey App' do
  include Rack::Test::Methods

  it 'should be OK' do
    get '/'
    expect(last_response).to be_ok
  end
end
