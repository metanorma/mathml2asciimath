require "spec_helper"

RSpec.describe MathML2AsciiMath do
  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <mrow>
      <mi>a</mi> <mo>⋄</mo> <msup><mi>x</mi><mn>2</mn></msup>
      <mo>+</mo><mi>b</mi><mo>×</mo><mi>x</mi>
      <mo>+</mo><msub><mi>c</mi><mn>3</mn></msub>
    </mrow>
    </math>
    INPUT
    a diamond x^2\n  + b xx x\n  + c_3
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <mrow>
      <mi>a</mi> <mo>⋄</mo> <msup><mi>x</mi><mn>2d</mn></msup>
      <mo>+</mo><mi>b</mi><mo>×</mo><mi>x</mi>
      <mo>+</mo><msub><mi>c</mi><mn>ab</mn></msub>
    </mrow>
    </math>
    INPUT
    a diamond x^(2d)\n+ b xx x\n+ c_(ab)
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <mfrac>
   <mrow> <mn> 1 </mn> <mo> + </mo> <msqrt> <mn> 5 </mn> </msqrt> </mrow>
 <mn> 2 </mn>
</mfrac>
    </math>
    INPUT
    (( 1 + sqrt( 5 ) ))/( 2 )
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <mfenced><mrow><mi> a </mi> <mo> + </mo> <mi> b </mi></mrow></mfenced>
    </math>
    INPUT
    ( a + b )
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mfenced open="["> <mn> 0 </mn> <mn> 1 </mn> </mfenced>
    </math>
    INPUT
    [ 0 , 1 )
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <munderover>
    <mo>&#x222B;</mo> <mn>0</mn> <mi>&#x221E;</mi>
  </munderover>
    </math>
    INPUT
    \u222B_0^( oo )
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <msubsup>
    <mo>&#x222B;</mo>
    <mn>ab</mn>
    <mn>ds</mn>
  </msubsup>
    </math>
    INPUT
    \u222B_(ab)^(ds)
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <munder>
  <mrow>
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo> &#x23DF;</mo>
</munder>
    </math>
    INPUT
    ubrace (\nx\n+\ny\n+\nz\n)
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <munder>
  <mrow>
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo> &#x0332;</mo>
</munder>
    </math>
    INPUT
    ul (\nx\n+\ny\n+\nz\n)
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <munder>
  <mrow>
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo>fred </mo>
</munder>
    </math>
    INPUT
    underset(fred)((\nx\n+\ny\n+\nz\n))
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mover accent="true">
  <mrow>
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo> &#x23DE;</mo>
</mover> 

    </math>
    INPUT
    obrace\nx\n+\ny\n+\nz
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mover accent="true">
  <mrow>
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo> &#x5e;</mo>
</mover> 

    </math>
    INPUT
    hat\nx\n+\ny\n+\nz
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mover accent="true">
  <mrow>
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo> &#xaf;</mo>
</mover> 

    </math>
    INPUT
    bar\nx\n+\ny\n+\nz
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mover accent="true">
  <mrow>  
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo>&#x2192;</mo>
</mover> 

    </math>
    INPUT
    vec\nx\n+\ny\n+\nz
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mover accent="true">
  <mrow>  
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo> .</mo>
</mover> 

    </math>
    INPUT
    dot\nx\n+\ny\n+\nz
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mover accent="true">
  <mrow>  
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo>..</mo>
</mover> 

    </math>
    INPUT
    ddot\nx\n+\ny\n+\nz
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
<mover accent="true">
  <mrow>  
    <mi> x </mi>
    <mo> + </mo>
    <mi> y </mi>
    <mo> + </mo>
    <mi> z </mi>
  </mrow>
  <mo>fred</mo>
</mover> 

    </math>
    INPUT
    overset(fred)(\nx\n+\ny\n+\nz\n)
    OUTPUT
  end

  it "processes some MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <mi>X</mi>
    <mo>=</mo>
    <mtable frame="solid" rowlines="solid" align="axis 3">
        <mtr>
             <mtd><mi>A</mi></mtd>
             <mtd><mi>B</mi></mtd>
        </mtr>
        <mtr>
             <mtd><mi>C</mi></mtd>
             <mtd><mi>D</mi></mtd>
        </mtr>
        <mtr>
             <mtd><mi>E</mi></mtd>
             <mtd><mi>F</mi></mtd>
        </mtr>
    </mtable>
    </math>
    INPUT
    X = [[A,B],[C,D],[E,F]]
    OUTPUT
  end

    it "processes some unknown MathML" do
    expect(MathML2AsciiMath.m2a(<<~INPUT)).to match_fuzzy <<~OUTPUT
    <math xmlns="http://www.w3.org/1998/Math/MathML">
    <mrow>
  <mi> x </mi>
  <mo> + </mo> 
  <mphantom>
    <mi> y </mi>
    <mo> + </mo>
  </mphantom>
  <mi> z </mi>
</mrow>
    </math>
    INPUT
    x\n+\n<mphantom>\n<mi> y </mi>\n<mo> + </mo>\n</mphantom>\nz
    OUTPUT
  end


end
