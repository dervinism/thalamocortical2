# thalamocortical2
Large-scale thalamocortical network model for simulating physiological and paroxysmal brain rhythms (4-7 Hz spike and wave discharges) described in manuscripts:

Dervinis, M and Crunelli, V (2023) Sleep waves in a large-scale corticothalamic model constrained by activities intrinsic to neocortical networks and single thalamic neurons. bioRxiv 2022.10.31.514504; doi: https://doi.org/10.1101/2022.10.31.514504

Dervinis, M and Crunelli, V (2023) Spike-and-wave discharges of absence seizures in a sleep waves-constrained corticothalamic model. bioRxiv 2022.10.31.514510; doi: https://doi.org/10.1101/2022.10.31.514510

The main file is ```init.hoc```

Language: Neuron

Major points:
- Executing the init.hoc file on Neuron with all the parameters set up as it is currently, would produce 20 minutes of simulated neural activity resembling wakefulness. The data is saved in DAT files corresponding to individual cell models in the network. The files contain time, voltage, and synaptic current data.
- In order to obtain simulations of physiological network sleep oscillations, adjust the ```state``` variable in the file ```init.hoc```.
- To get pure cortical simulations, set variables isFO and isHO to zero in the file ThCxprocs.hoc.
- To obtain SWDs induced by the hyperpolarisation of thalamocortical (TC) cells, set the ```state``` variable inside the ```init.hoc``` file to ```'SWDs_long'```.
- To obtain SWDs induced by tonic GABAa inhibition of TC cells, set the ```state``` variable inside the ```init.hoc``` file to ```'awake_long'``` and adjust variable ```GABAfullsyn.gbar_c``` on line 698 inside the ```TCcell.hoc file```.
