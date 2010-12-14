class TestingRequirements
 @@by_gup = {
  14 => {"months"=>3, "classes"=>12}, #mighty kids Yellow Stripe
  13 => {"months"=>3, "classes"=>12}, #mighty kids White/Yellow
  12 => {"months"=>3, "classes"=>12}, #mighty kids Orange Stripe
  11 => {"months"=>3, "classes"=>12}, #mighty kids Green Stripe
  10 => {"months"=>3, "classes"=>12}, #white belt (for mighty kids transitioning to 9th gup)
  9 => {"months"=>3, "classes"=>24},
  8 => {"months"=>3, "classes"=>24},
  7 => {"months"=>3, "classes"=>24},
  6 => {"months"=>3, "classes"=>24},
  5 => {"months"=>4, "classes"=>32},
  4 => {"months"=>4, "classes"=>32},
  3 => {"months"=>4, "classes"=>32},
  2 => {"months"=>5, "classes"=>40},
  1 => {"months"=>6, "classes"=>48},
  0 => {"months"=>6, "classes"=>48}, #1st Dan
  -1 => {"months"=>30, "classes"=>0}, #2nd Dan
  -2 => {"months"=>42, "classes"=>0}, #3rd Dan
  -3 => {"months"=>54, "classes"=>0}, #4th Dan
  -4 => {"months"=>66, "classes"=>0}, #5th Dan
  -5 => {"months"=>78, "classes"=>0}
 }
 
 def self.by_gup
   @@by_gup
 end
 
end