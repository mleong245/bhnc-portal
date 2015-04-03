ValidatesFormattingOf::Method.add :address, /(\d{3,})\s?(\w{0,5})\s([a-zA-Z]{2,30})\s([a-zA-Z]{2,15})\.?\s?(\w{0,5})/, "Must be a valid address"
