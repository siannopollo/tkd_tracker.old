class GupNames
  @@by_gup = {
              15 => "Mighty Kid White",
              14 => "Mighty Kid Yellow Stripe",
              13 => "Mighty Kid White/Yellow",
              12 => "Mighty Kid Orange Stripe",
              11 => "Mighty Kid Green Stripe",
              10 => "10th Gup, White Belt",
               9 => "9th Gup, Yellow Stripe",
               8 => "8th Gup, Yellow",
               7 => "7th Gup, Orange",
               6 => "6th Gup, Green",
               5 => "5th Gup, Blue",
               4 => "4th Gup, Purple",
               3 => "3rd Gup, Red",
               2 => "2nd Gup, Brown",
               1 => "1st Gup, Brown/Black",
               0 => "1st Dan",
              -1 => "2nd Dan",
              -2 => "3rd Dan",
              -3 => "4th Dan",
              -4 => "5th Dan"
               }
  
  def self.by_gup
   @@by_gup
  end
 
  def self.for_html_select
    to_return = Array.new
    15.downto(-4) do | i |
      to_return << [@@by_gup[i], i]
    end
    to_return    
  end
end