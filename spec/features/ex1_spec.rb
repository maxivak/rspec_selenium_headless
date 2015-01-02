
RSpec.describe "My test", :type => :request do

  describe "my tests" do
  
    # for Linux env
    unless Gem.win_platform?
      headless = Headless.new(display: 99, autopick: true, reuse: false, destroy_at_exit: true).start
    end
      
    
      
    it "simple eq" do 
      expect(3).to eq(3)
      expect(3).not_to eq(4)
    end    
    
    it "home page" do
      visit "http://stackoverflow.com"
      
      expect(page).to have_selector 'h1', text: /Top Questions/i

    end
    
    it "questions" do
      visit "http://stackoverflow.com/questions"
      
      within("#questions") do
        links = all('h3 a')
        
        links.each do |link|
          expect(link[:href]).to match /questions\/\d+\//
        end
      end
      
    end

    
  end
  
  

end

