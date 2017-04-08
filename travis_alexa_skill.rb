require 'alexa_generator'
require 'json'

interaction_model = AlexaGenerator::InteractionModel.build do |model|
  model.add_intent(:travis) do |intent|
    intent.add_slot(:repos, AlexaGenerator::Slot::SlotType::LITERAL) do |slot|
      slot.add_bindings(*%w())
    end

    intent.add_utterance_template('what is {repos} status')
  end
end

puts JSON.pretty_generate(interaction_model.intent_schema)

puts interaction_model.sample_utterances(:travis)
