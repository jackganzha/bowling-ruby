require File.expand_path( File.dirname(__FILE__) + '/../lib/bowling')

describe Bowling do

    describe "#strikes_score" do
      it "10 strikes should scores 300" do
        subject.strikes_score("XXXXXXXXXX").should == 300
      end
      it "9  strikes should scores 270" do
        subject.strikes_score("XXXXXXXXX-").should == 270
      end
      it "8  strikes should scores 240" do
        subject.strikes_score("XXXXXXXX--").should == 240
      end
      it "7  strikes should scores 210" do
        subject.strikes_score("XXXXXXX---").should == 210
      end
      it "0  strikes should scores 0" do
        subject.strikes_score("----------").should == 0
      end
    end

    describe "#spares_score" do
      it "10 spares should scores 150" do
        subject.spares_score("1/1/1/1/1/1/1/1/1/1/").should == 150
      end
      it "9  spares should scores 135" do
        subject.spares_score("1/1/1/1/1/1/1/1/1/--").should == 135
      end
      it "8  spares should scores 120" do
        subject.spares_score("1/1/1/1/1/1/1/1/----").should == 120
      end
      it "5  spares should scores 75" do
        subject.spares_score("1/1/1/1/1/----------").should == 75
      end
      it "1  spare  should scores 15" do
        subject.spares_score("1/------------------").should == 15
      end
      it "0  spare  should scores 0" do
        subject.spares_score("--------------------").should == 0
      end
    end

    describe "#score" do
      it "9 strikes and 1 spare  should scores 285" do
        subject.score("XXXXXXXXX1/").should == 285
      end
      it "8 strikes and 2 spares should scores 270" do
        subject.score("XXXXXXXX1/1/").should == 270
      end
      it "7 strikes and 3 spares should scores 255" do
        subject.score("XXXXXXX1/1/1/").should == 255
      end
      it "1 strike  and 9 spares should scores 165" do
        subject.score("X1/1/1/1/1/1/1/1/1/").should == 165
      end
      it "8 strikes, 1 spare and 2 misses should scores 255" do
        subject.score("XXXXXXXX1/--").should == 255
      end
      it "8 strikes, 1 spare, 2 and 6 should scores 263" do
        subject.score("XXXXXXXX1/26").should == 263
      end
      it "7 strikes, 1 spare, 2 and 6 and 2 misses should score 235" do
        subject.score("XXXXXXX1/26--").should == 233
      end
      it "6 and 2 and misses scores 8" do
        subject.score("62------------------").should == 8
      end
      it "just misses scores 0" do
        subject.score("--------------------").should == 0
      end
      it "hit 8 and misses scores 8" do
        subject.score("8-------------------").should == 8
      end
      it "a miss and spare and misses scores 15" do
        subject.score("-/------------------").should == 15
      end
      it "1 strike, 1 spare, 6 and 2 scores 53" do
        subject.score("X--6/62------------").should == 53
      end
    end
end

