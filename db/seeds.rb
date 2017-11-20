require "pry-byebug"

Question.destroy_all
Answer.destroy_all

questions = [{
  description: "What does your weekend look like?",
  order: 1
  },
  {
  description: "Where do you see yourself?",
  order: 2
  },
  {
  description: "What is your beverage of choice?",
  order: 3
  },
  {
  description: "What kind of food do you prefer?",
  order: 4
  }
]

questions.each do |question|
  Question.create(question)
end

answers = [{
  img_url: "q1_a1.jpg",
  question_id: 1,
  score_id:
  },
  {
  img_url: "q1_a2.jpg",
  question_id: 1,
  score_id:
  },
  {
  img_url: "q1_a3.jpg",
  question_id: 1,
  score_id:
  },
  {
  img_url: "q1_a4.jpg",
  question_id: 1,
  score_id:
  },
  {
  img_url: "q2_a1.jpg",
  question_id: 2,
  score_id:
  },
  {
  img_url: "q2_a2.jpg",
  question_id: 2,
  score_id:
  },
  {
  img_url: "q2_a3.jpg",
  question_id: 2,
  score_id:
  },
  {
  img_url: "q2_a4.jpg",
  question_id: 2,
  score_id:
  },
  {
  img_url: "q3_a1.jpg",
  question_id: 3,
  score_id:
  },
  {
  img_url: "q3_a2.jpg",
  question_id: 3,
  score_id:
  },
  {
  img_url: "q3_a3.jpg",
  question_id: 3,
  score_id:
  },
  {
  img_url: "q3_a4.jpg",
  question_id: 3,
  score_id:
  },
  {
  img_url: "q4_a1.jpg",
  question_id: 4,
  score_id:
  },
  {
  img_url: "q4_a2.jpg",
  question_id: 4,
  score_id:
  },
  {
  img_url: "q4_a3.jpg",
  question_id: 4,
  score_id:
  },
  {
  img_url: "q4_a4.jpg",
  question_id: 4,
  score_id:
  }
]

answers.each do |answer|
  answer = Answer.create(answer)
  byebug
end
