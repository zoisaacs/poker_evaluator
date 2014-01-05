
#Successfully passes 18 tests on full_poker.rb, which contains everything in lib in one file. Execute "rspec spec" in Terminal on the project directory "poker_hand_evaluator" to see them pass.
require 'spec_helper'

describe Pokerhand do
  before :each do
    @straightace = Pokerhand.new(%w{AS KS JS QS TH})
    @flushking_queen = Pokerhand.new(%w{2H 4H 6H KH QH})
    @twopair5and9 = Pokerhand.new(%w{5S 5D 9H 9C 6S})
    @straight5 = Pokerhand.new(%w{2C 3D 4H AC 5S})
    @fullhouse10over7 = Pokerhand.new(%w{TD TC TH 7C 7D})
    @fourofakind9 = Pokerhand.new(%w{9D 9H 9S 9C 7D})
    @royalflush = Pokerhand.new(%w{QC KC JC AC TC})
    @ace_10high = Pokerhand.new(%w{AS 2S 3S 4S TC})
    @threeofakind2 = Pokerhand.new(%w{2H 2D 2S 5D 8D})
    @pair9 = Pokerhand.new(%w{9C 9S 8D 5H 7S})
    @fivehighstraightflush = Pokerhand.new(%w{AD 5D 4D 2D 3D})
  end

  describe "#new" do

    it "is a new Pokerhand object" do
      @flushking_queen.should be_an_instance_of Pokerhand
    end
    
    it "has five cards" do
      @flushking_queen.cards.count.should == 5
    end

    context "with the card processor" do

      it "separates the cards correctly" do
        @straight5.processed_cards.length.should == 10
      end

      it "makes the processed cards an array" do
        @straight5.processed_cards.kind_of?(Array).should == true
      end
    end

    it "turn a 13 into a King for final presentation" do
      @flushking_queen.best_card.should == "King"
    end
    
    context "with the criteria for straight/flush hands" do
   
      it "meets criteria for a Straight Flush" do
        @fivehighstraightflush.criteria(0,3).should == true
      end

      it "fails the criteria for a Flush, Straight Flush, and Royal Flush" do
        @straight5.criteria(2,4).should == false
      end
    end

    context "with the criteria for two, three, and four of a kind hands" do

      it "is a Three of a Kind" do
        @threeofakind2.of_a_kind(3).should == 2
      end

      it "is not a Four of a Kind" do
        @pair9.of_a_kind(4).should == 2014
      end
    end
    context "with the first element of the ranking array" do
    
      it "is a flush ranking" do
        @flushking_queen.what_rank.should == 6
      end

      it "is a three of a kind ranking" do
        @threeofakind2.what_rank.should == 4
      end
    end

    context "with the second element in the ranking array" do

      it "receives a 14 for a royal flush" do
        @royalflush.tie_breaker.should == 14
      end
  
      it "receives [high_pair, low_pair] for the second element of array ranking for two pair" do
        @twopair5and9.tie_breaker.should == [9, 5] 
      end
    end

    context "with both elements of the ranking array" do
 
      it "is a Full House with 10's over 7's" do
        @fullhouse10over7.ranking.should == [7, 10, [10, 10, 10, 7, 7]]
      end

      it "is a Three of a Kind with 2's" do
        @threeofakind2.ranking.should == [4, 2, [8, 5, 2, 2, 2]]
      end

      it "is the right size array" do
        @fivehighstraightflush.ranking.length.should be >= 3
      end
    end

    it "returns pair less than straight flush" do
      @pair9.ranking <=> @fivehighstraightflush.ranking = -1
    end

    it "returns four of a kind greater than straight" do
      @fourofakind9.ranking <=> @straightace.ranking = 1
    end
  end
end
