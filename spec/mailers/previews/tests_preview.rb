# Preview all emails at http://localhost:3000/rails/mailers/tests
class TestsPreview < ActionMailer::Preview
  let(:test_passage) { create(:test_passage, test: test) }

  TestsMailer.completed_test(test_passage)
end
