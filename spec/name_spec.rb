# encoding: utf-8
require 'spec_helper'

describe "Mods Name" do
  
  it "should recognize subelements" do
    Mods::Name::SUBELEMENTS.each { |e|
      @mods_rec.from_str("<mods><name><#{e}>oofda</#{e}></name></mods>")
      @mods_rec.name.send(e).text.should == 'oofda'
    }
  end

  it "should recognize attributes on name node" do
    Mods::Name::ATTRIBUTES.each { |attrb|  
      @mods.from_str("<mods><name #{attrb}='hello'><displayForm>q</displayForm></name></mods>")
      @mods.name.send(attrb).should == 'hello'
    }
  end
  
  context "personal_author" do
    s = '<mods:name authority="local" type="personal">
      <mods:role>
        <mods:roleTerm authority="marcrelator" type="text">creator</mods:roleTerm>
      </mods:role>
      <mods:namePart>Gravé par Denise Macquart.</mods:namePart>
    </mods:name>
    '
    
    it "should do soemthing" do
      s = '<mods:name authority="local" type="personal">
        <mods:namePart>Buffier, Claude</mods:namePart>
      </mods:name>
      '
      pending "to be implemented"
    end
    it "should do soemthing" do
      s = '<mods:name>
        <mods:namePart type="given">Zaphod</mods:namePart>
        <mods:namePart type="family">Beeblebrox</mods:namePart>
        <mods:namePart type="date">1912-2362</mods:namePart>
      </mods:name>
      '
      pending "to be implemented"
    end
    it "should do something" do
      s = '<mods:name>
        <mods:namePart type="given">Jorge Luis</mods:namePart>
        <mods:namePart type="family">Borges</mods:namePart>
      </mods:name>
      '
      pending "to be implemented"
    end
  end
  
  before(:all) do
    @mods_rec = Mods::Record.new
    @corp_name = 'ABC corp'
    @mods_w_corp_name = "<mods><name type='corporate'><namePart>#{@corp_name}</namePart></name></mods>"
    @corp_name_role = '<mods><name type="corporate"><namePart>DEF corp</namePart><role><roleTerm type="text">lithographer</roleTerm></role></name></mods>'
    @pers_name = 'Crusty'
    @mods_w_pers_name = "<mods><name type='personal'><namePart>#{@pers_name}</namePart></name></mods>"
    @mods_w_both = "<mods><name type='corporate'><namePart>#{@corp_name}</namePart></name><name type='personal'><namePart>#{@pers_name}</namePart></name></mods>"
  end
  
  context "corporate_author" do
    it "should include name elements with type attr = corporate" do
      @mods_rec.from_str(@mods_w_corp_name)
      @mods_rec.corporate_name.namePart.text.should == @corp_name
      @mods_rec.from_str(@mods_w_both).corporate_name.namePart.text.should == @corp_name
    end
    it "should not include name elements with type attr != corporate" do
      @mods_rec.from_str(@mods_w_pers_name)
      @mods_rec.corporate_name.namePart.text.should == ""
      @mods_rec.from_str(@mods_w_both).corporate_name.namePart.text.should_not match(@pers_name)
    end
  end  
  
  context "namePart subelement" do

    it "should recognize type attribute on namePart element" do
      Mods::Name::NAME_PART_TYPES.each { |t|  
        @mods.from_str("<mods><name><namePart type='#{t}'>hi</namePart></name></mods>")
        @mods.name.namePart.type.should == t
      }
    end

  end

  context "role subelement" do
    it "should work when there is no subelement" do
      pending "to be implemented"
    end
    it "should work when there is a roleTerm subelement" do
      pending "to be implemented"
    end
    it "should do something when there is some other illegal subelement" do
      pending "to be implemented"
    end
    it "should translate the marc relator code into text" do
      pending "to be implemented"
    end
  end
  
  context "value for mods.name" do
    it "should prefer displayForm subelement value to concat of namePart subelement values" do
      str =  '<mods><name><displayForm>Mr. Foo Bar</displayForm><namePart>a</namePart><namePart>b</namePart></name></mods>'
      @mods.from_str(str)
      @mods.name.displayForm.should == ["Mr. Foo Bar"]
      @mods.name.should == ["Mr. Foo Bar"]
    end
    it "should give concat of nameParts if there is no displayForm subelement" do
      @mods.from_str('<mods><name><namePart>a</namePart><namePart>b</namePart></name></mods>')
      @mods.name.should == ["a b"]
    end
    it "should order the namePart elements according to their type attribute, if present" do
      pending "to be implemented"
    end
    it "should combine any and all subelements into a useful string" do
      pending "to be implemented"
      @mods.name.should == ["first name pieces", "second name pieces"]
    end
    
  end
  
  
end