# encoding: utf-8
require 'spec_helper'

describe "Mods <originInfo> Element" do
  before(:all) do
    @mods_rec = Mods::Record.new
    @kolb = '<mods>
    <originInfo>
            <dateCreated>1537-1553.</dateCreated>
            <dateCreated point="start">1537</dateCreated>
            <dateCreated point="end">1553</dateCreated>
        </originInfo></mods>'
    @reid_dennis = '<mods><originInfo><dateIssued>1852</dateIssued></originInfo></mods>'
    @walters = '<mods><originInfo>
       <place>
          <placeTerm type="text">Iran</placeTerm>
       </place>
       <dateIssued>22 Rabīʿ II 889 AH / 1484 CE</dateIssued>
       <issuance>monographic</issuance>
    </originInfo>
    </mods>'
    @simple = '<mods><originInfo><dateIssued>circa 1900</dateIssued></originInfo></mods>'
    @ew = '<mods><originInfo>
      <place>
        <placeTerm type="text">Reichenau Abbey, Lake Constance, Germany</placeTerm>
      </place>
      <dateIssued>Middle of the 11th century CE</dateIssued>
      <issuance>monographic</issuance>
    </originInfo>
    </mods>'
    @e = '<mods><originInfo>
              <place>
                 <placeTerm type="code" authority="marccountry">au</placeTerm>
              </place>
              <place>
                 <placeTerm type="text">[Austria?</placeTerm>
              </place>
              <dateIssued>circa 1180-1199]</dateIssued>
              <issuance>monographic</issuance>
           </originInfo></mods>'
    @f = '<mods>       <originInfo>
             <place>
               <placeTerm authority="marccountry" type="code">cau</placeTerm>
             </place>
             <dateIssued encoding="marc" keyDate="yes" point="start">1850</dateIssued>
             <dateIssued encoding="marc" point="end">1906</dateIssued>
             <issuance>monographic</issuance>
           </originInfo>
    </mods>'
    @ex = '<mods><originInfo>
      <place>
        <placeTerm>France and Italy</placeTerm>
      </place>
      <dateCreated keyDate="yes" qualifier="inferred">173-?</dateCreated>
    </originInfo>
    </mods>'
    @ex1 = '<mods><originInfo>
  	<publisher>Robot Publishing</publisher>
      <place>
        <placeTerm>France</placeTerm>
      </place>
      <place>
        <placeTerm>Italy</placeTerm>
      </place>
      <dateCreated keyDate="yes" qualifier="inferred">173-?</dateCreated>
  	<dateIssued>1850</dateIssued>
    </originInfo>
    </mods>'
    @ex2 = '<mods><originInfo>
        <place>
           <placeTerm type="code" authority="marccountry">enk</placeTerm>
        </place>
        <place>
           <placeTerm type="text">[London]</placeTerm>
        </place>
        <publisher>Bunney &amp; Gold</publisher>
        <dateIssued>1799</dateIssued>
        <dateIssued encoding="marc" keyDate="yes">1799</dateIssued>
        <issuance>monographic</issuance>
     </originInfo>
    </mods>'
    @ex3 = '<mods><originInfo>
       <place>
          <placeTerm type="code" authority="marccountry">xx</placeTerm>
       </place>
       <place>
          <placeTerm type="text">[s.l. : s.n.]</placeTerm>
       </place>
       <dateIssued>1780?]</dateIssued>
       <dateIssued encoding="marc" keyDate="yes">178u</dateIssued>
       <issuance>monographic</issuance>
    </originInfo>
    </mods>'
    @ex4 = '<mods><originInfo>
       <place>
          <placeTerm type="code" authority="marccountry">fr</placeTerm>
       </place>
       <place>
          <placeTerm type="text">[S.l.]</placeTerm>
       </place>
       <publisher>[s.n.]</publisher>
       <dateIssued>[1740.]</dateIssued>
       <dateIssued encoding="marc" point="start" qualifier="questionable" keyDate="yes">1740</dateIssued>
       <dateIssued encoding="marc" point="end" qualifier="questionable">1749</dateIssued>
       <issuance>monographic</issuance>
    </originInfo>
    </mods>'
    @ex5 = '<mods><originInfo>
        <place>
           <placeTerm type="code" authority="marccountry">xx</placeTerm>
        </place>
        <place>
           <placeTerm type="text">[S.l.]</placeTerm>
        </place>
        <publisher>Olney</publisher>
        <dateIssued>1844</dateIssued>
        <dateIssued encoding="marc" keyDate="yes">1844</dateIssued>
        <issuance>monographic</issuance>
     </originInfo>
    </mods>'
    @ex6 = '<mods><originInfo>
       <place>
          <placeTerm type="code" authority="marccountry">enk</placeTerm>
       </place>
       <place>
          <placeTerm type="text">[London</placeTerm>
       </place>
       <publisher>Printed for William Innys and Joseph Richardson ... [et al.]</publisher>
       <dateIssued>1752]</dateIssued>
       <dateIssued encoding="marc" keyDate="yes">1752</dateIssued>
       <issuance>monographic</issuance>
    </originInfo>
    </mods>'
    @ex7 = '<mods><originInfo>
       <place>
          <placeTerm authority="marccountry" type="code">fr</placeTerm>
       </place>
       <place>
          <placeTerm type="text">[S.l.]</placeTerm>
       </place>
       <publisher>[s.n.]</publisher>
       <dateIssued>[1740.]</dateIssued>
       <dateIssued encoding="marc" keyDate="yes" point="start" qualifier="questionable">1740</dateIssued>
       <dateIssued encoding="marc" point="end" qualifier="questionable">1749</dateIssued>
       <issuance>monographic</issuance>
    </originInfo>
    </mods>'
    
    xml = '<originInfo>
    <dateCreated encoding="w3cdtf" keyDate="yes" point="start" qualifier="approximate">250 B.C.</dateCreated>
    <dateCreated encoding="w3cdtf" keyDate="yes" point="end" qualifier="approximate">150 B.C.</dateCreated>
    </originInfo>'
    
  end

  context "basic origin_info terminology pieces" do
    before(:all) do
      @mods_rec.from_str(@form_and_extent)
    end

    context "place child element" do
      before(:all) do
        @place_term_text = '<mods><originInfo><place><placeTerm type="text">Iran</placeTerm></place></originInfo></mods>'
        @place_term_plain_mult = '<mods><originInfo>
                      <place><placeTerm>France</placeTerm></place>
                      <place><placeTerm>Italy</placeTerm></place></originInfo></mods>'
        @place_term_code = '<mods><originInfo><place><placeTerm authority="marccountry" type="code">fr</placeTerm></place></originInfo></mods>'
        @yuck1 = '<mods><originInfo><place><placeTerm type="text">[S.l.]</placeTerm></place></originInfo></mods>'
        @yuck2 = '<mods><originInfo><place><placeTerm type="text">[London</placeTerm></place></originInfo></mods>'
        @yuck3 = '<mods><originInfo><place><placeTerm type="text">[s.l. : s.n.]</placeTerm></place></originInfo></mods>'
        @yuck4 = '<mods><originInfo><place><placeTerm type="text">[London]</placeTerm></place></originInfo></mods>'
      end
      context "placeTerm child element" do
        it "should get element values" do
          vals = @mods_rec.from_str(@place_term_plain_mult).origin_info.place.placeTerm.map { |e| e.text}
          vals.size.should == 2
          vals.should include("France")
          vals.should include("Italy")
        end
        it "should get authority attribute" do
          @mods_rec.from_str(@place_term_code).origin_info.place.placeTerm.authority.should == ["marccountry"]
        end
        it "should get type(_at) attribute" do
          @mods_rec.from_str(@place_term_code).origin_info.place.placeTerm.type_at.should == ["code"]
        end
        it "should be able to translate marccountry codes" do
          pending "to be implemented"
        end
        it "should ignore s.l. value (from MARC)" do
          pending "to be implemented"
        end
        it "should be forgiving of square brackets (from MARC), matched or unmatched" do
          pending "to be implemented"
        end
      end # placeTerm
    end # place
      
    context "publisher child element" do
      before(:all) do
        @ex = '<mods><originInfo><publisher>Olney</publisher></origin_info></mods>'
        @yuck1 = '<mods><originInfo><publisher>[s.n.]</publisher></originInfo></mods>'
        @yuck2 = '<mods><originInfo><publisher>Printed for William Innys and Joseph Richardson ... [et al.]</publisher></originInfo></mods>'
      end
      it "should get element values" do
        vals = @mods_rec.from_str('<mods><originInfo><publisher>Olney</publisher></origin_info></mods>').origin_info.publisher
        vals.should == ["Olney"]
      end
      it "should ignore s.n. value (from MARC)" do
        pending "to be implemented"
      end
      it "should leave square brackets alone, except for s.n." do
        pending "to be implemented"
      end
    end
    
    context "various date child elements" do
      it "should recognize each element" do
        Mods::ORIGIN_INFO_DATE_ELEMENTS.each { |elname|
          @mods_rec.from_str("<mods><originInfo><#{elname}>date</#{elname}></originInfo></mods>")
          @mods_rec.origin_info.send(elname.to_sym).should == ["date"]
        }
      end
      it "should recognize encoding attribute on each element" do
        Mods::ORIGIN_INFO_DATE_ELEMENTS.each { |elname|
          @mods_rec.from_str("<mods><originInfo><#{elname} encoding='foo'>date</#{elname}></originInfo></mods>")
          @mods_rec.origin_info.send(elname.to_sym).encoding.should == ["foo"]
        }
      end
      it "should recognize keyDate attribute" do
        Mods::ORIGIN_INFO_DATE_ELEMENTS.each { |elname|
          @mods_rec.from_str("<mods><originInfo><#{elname} keyDate='foo'>date</#{elname}></originInfo></mods>")
          @mods_rec.origin_info.send(elname.to_sym).keyDate.should == ["foo"]
        }
      end
      it "should recognize point attribute" do
        # NOTE: values allowed are 'start' and 'end'
        Mods::ORIGIN_INFO_DATE_ELEMENTS.each { |elname|
          @mods_rec.from_str("<mods><originInfo><#{elname} point='foo'>date</#{elname}></originInfo></mods>")
          @mods_rec.origin_info.send(elname.to_sym).point.should == ["foo"]
        }
      end
      it "should recognize qualifier attribute" do
        Mods::ORIGIN_INFO_DATE_ELEMENTS.each { |elname|
          @mods_rec.from_str("<mods><originInfo><#{elname} qualifier='foo'>date</#{elname}></originInfo></mods>")
          @mods_rec.origin_info.send(elname.to_sym).qualifier.should == ["foo"]
        }
      end
      it "should recognize type attribute only on dateOther" do
        Mods::ORIGIN_INFO_DATE_ELEMENTS.each { |elname|
          @mods_rec.from_str("<mods><originInfo><#{elname} type='foo'>date</#{elname}></originInfo></mods>")
          if elname == 'dateOther'
            @mods_rec.origin_info.send(elname.to_sym).type_at.should == ["foo"]
          else
            expect { @mods_rec.origin_info.send(elname.to_sym).type_at}.to raise_exception(NoMethodError, /type_at/)
          end
        }
      end
      it "should know something about various date encodings: w3cdtf, iso8601, marc, edtf, temper" do
        pending "to be implemented"
      end
      it "should know the only valid values for point attribute are 'start' and 'end'" do
        pending "to be implemented"
      end
      it "should know the only valid value for keyDate attribute is 'yes" do
        pending "to be implemented"
      end
      it "should know the only valid values for qualifier attribute: approximate, inferred, questionable" do
        pending "to be implemented"
      end
    end
    
    it "edition child element" do
      pending "to be implemented"
    end
    
    context "issuance child element" do
      
      it "should know the only valid values are: continuing, monographic, single unit, multipart monograph, serial, integrating resource" do
        pending "to be implemented"
      end
    end
    
    context "frequency child element" do
      
    end
  end # basic terminology

  context "parsing date values" do
    it "should cope with slop" do
      pending "to be implemented"
    end
    
  end


end