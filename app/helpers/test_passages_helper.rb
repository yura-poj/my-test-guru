module TestPassagesHelper

  def progress
    (100 / @test_passage.test.questions.size ) * (@test_passage.step - 1)
  end

end
