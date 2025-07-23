from transformers import AutoTokenizer, AutoModelForSequenceClassification, Trainer, TrainingArguments
from datasets import load_dataset
import torch

dataset = load_dataset("csv", data_files="back/train_datasets/suspecious_dataset.csv")["train"]

split_dataset = dataset.train_test_split(test_size=0.2)

model_name = "cointegrated/rubert-tiny2"
tokenizer = AutoTokenizer.from_pretrained(model_name)

def tokenize(batch):
    return tokenizer(batch['text'], padding=True, truncation=True)

split_dataset = split_dataset.map(tokenize, batched=True)

model = AutoModelForSequenceClassification.from_pretrained(model_name, num_labels=2)

args = TrainingArguments(
    output_dir="./results",
    eval_strategy="epoch",
    learning_rate=2e-5,
    per_device_train_batch_size=8,
    num_train_epochs=10,
    weight_decay=0.01,
)

trainer = Trainer(
    model=model,
    args=args,
    train_dataset=split_dataset['train'],
    eval_dataset=split_dataset['test'],
)

# trainer.train()

trainer.save_model("toxicity_model_v2")
tokenizer.save_pretrained("toxicity_model_v2")
