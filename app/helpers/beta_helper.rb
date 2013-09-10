module BetaHelper

	def getBetaCount
		@count = Betum.find(:all).count
	end

end
