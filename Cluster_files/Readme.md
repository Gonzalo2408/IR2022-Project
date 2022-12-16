This folder contains all the scripts we used to run the models on the cluster. 

Run_tfrecord converts specified run files to tfrecord so they can be used for training and evaluation. 

There is also three scripts for run_treccovid. These refer to the models we have trained. 

They are currently written to evaluate on CDS since that was the last task we did for this project.

_base is for the Medical BERT model without fine-tuning.

_2 has been trained for 100 000 iterations. 

the one without any extension was ran for 40 000 training iterations.