module TestPassagesHelper

  def progress
    @test_passage.step ? (100 / @test_passage.test.questions.size ) * (@test_passage.step - 1) : 0
  end

end
