class EscritorioController < ApplicationController
	before_filter :authenticate_user!
end
