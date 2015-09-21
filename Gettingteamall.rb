require "rubygems"
require "nokogiri"
require 'open-uri'
def formattedresults(doc,index)
    
    d1 = doc.css(".rank-table tr")
    team_name = []
    college_name = []
    member = []

    i = 0
    d1.each do |team|
        if team.text.split("\n").length >=3
            #puts i.to_s+"\t\t"+team
            team_raw = team.text.split("\n")
            team_name[i] = team_raw[1].strip
            if team_name[2] != nil
                college_name[i] = team_raw[2].strip
            else
                college_name[i]=""
            end
            members = team_raw[3].strip.split(",")
            member[i] = members
            i+=1
       end
    end


    #Formatting the document
   
    j = 0
    i.times do
    if j!=0
        print (j+25*index).to_s+"\t\t"+team_name[j].to_s+"\t\t"+college_name[j].to_s+"\t\t"
        
        member[j].each do |ev|
            print ev.to_s+" "
        end
        
        print "\n"
        end
    j+=1
    end
end

def calling_pages()
    i = 1
    j = 25
    puts "No.\t\tTeam Name\t\tCollege Name\t\tMembers"
    j.times do
    ur = "https://www.codechef.com/teams/list/INSQ2015?page="+i.to_s
    doc = Nokogiri::HTML(open(ur,:proxy=>"http://172.31.100.85:5869"))
    formattedresults(doc,i-1)
    i+=1
    end
end
calling_pages()

