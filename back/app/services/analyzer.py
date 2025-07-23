from app.models.toxicity_model import model, tokenizer
import torch

def analyze_text(text: str):
    inputs = tokenizer(text, return_tensors="pt", truncation=True, padding=True)
    with torch.no_grad():
        outputs = model(**inputs)
    probs = torch.nn.functional.softmax(outputs.logits, dim=1)
    toxic_score = probs[0][1].item()
    return {"toxic_score": toxic_score, "label": "toxic" if toxic_score > 0.5 else "ok"}
