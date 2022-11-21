import pandas as pd
import xml.etree.ElementTree as ET

# Adapt to your own filepath (and outcomment the other ones ;))
topics_trec = r"C:\Users\celen\Documents\Radboud year 2\Information Retrieval\IR2022-Project\TREC_COVID\topics-rnd5.xml"
qrels = r"C:\Users\celen\Documents\Radboud year 2\Information Retrieval\IR2022-Project\TREC_COVID\qrels-covid_d5_j0.5-5.txt"

topics = {}
root = ET.parse(topics_trec).getroot()
for topic in root.findall("topic"):
    topic_number = topic.attrib["number"]
    topics[topic_number] = {}
    for query in topic.findall("query"):
        topics[topic_number]["query"] = query.text
    for question in topic.findall("question"):
        topics[topic_number]["question"] = question.text        
    for narrative in topic.findall("narrative"):
        topics[topic_number]["narrative"] = narrative.text        

print(topics["1"])

relevance_data = pd.read_csv(qrels, sep=" ", header=None)
relevance_data.columns = ["topic_id", "round_id", "cord_uid", "relevancy"]

# Remove this relevancy (-1), seems like an error
relevance_data[relevance_data.relevancy == -1]

with open(qrels, 'r') as qrel_file:
    for _ in range(30):
        print(next(qrel_file)[:-1])