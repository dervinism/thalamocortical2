TITLE Triple-exp model of NMDAR has (HH-type gating) (temp. sensitivity) (voltage-dependent time constants) (desensitization)

COMMENT
This is a Triple-exponential model of an NMDAR 
that has a slow voltage-dependent gating component in its conductance
time constants are voltage-dependent and temperature sensitive

Mg++ voltage dependency from Spruston95 -> Woodhull, 1973 

Desensitization is introduced in this model. Actually, this model has 4 differential equations
becasue desensitization is solved analitically. It can be reduced to 3 by solving its A state analitically.
For more info read the original paper. 

Keivan Moradi 2012

ENDCOMMENT

NEURON {
	POINT_PROCESS Exp5NMDA
	NONSPECIFIC_CURRENT i
	RANGE tau1, tau1_init, tau2_0, a2, b2, wtau2, tau3_0, a3, b3, tauV, e
    RANGE i, gVI, gVDst, gVDv0, Mg, K0, delta, tp, wf, tau_D1, d1, tauAdj, gf, P_release
	GLOBAL inf, tau2, tau3
	THREADSAFE : only true if every instance has its own distinct Random
    POINTER donotuse
}

UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(uS) = (microsiemens)
	(mM) = (milli/liter)
	(S)  = (siemens)
	(pS) = (picosiemens)
	(um) = (micron)
	(J)  = (joules)
}

PARAMETER {
: Parameters Control Neurotransmitter and Voltage-dependent gating of NMDAR
	tau1_init = 1.69		(ms)	<1e-9,1e9>	: Spruston95 CA1 dend [Mg=0 v=-80 celcius=18] be careful: Mg can change these values
: parameters control exponential rise to a maximum of tau2
	tau2_0 = 3.97	(ms)
	a2 = 0.70		(ms)
	b2 = 0.0243		(1/mV)
	wtau2= 0.65		<1e-9,1> : Hestrin90
	
: parameters control exponential rise to a maximum of tau3
	tau3_0 = 41.62	(ms)
	a3 = 34.69		(ms)
	b3 = 0.01		(1/mV)
	: Hestrin90 CA1 soma  [Mg=1 v=-40 celcius=30-32] the decay of the NMDA component of the EPSC recorded at temperatures above 30 degC 
	: the fast phase of decay, which accounted for 65%-+12% of the decay, had a time constant of 23.5-+3.8 ms, 
	: whereas the slow component had a time constant of 123-+83 ms.
	: wtau2= 0.78 Spruston95 CA1 dend [Mg=0 v=-80 celcius=18] percentage of contribution of tau2 in deactivation of NMDAR
	Q10_tau1 = 2.2			: Hestrin90
	Q10_tau2 = 3.68			: Hestrin90 -> 3.5-+0.9, Korinek10 -> NR1/2B -> 3.68
	Q10_tau3 = 2.65			: Korinek10
	T0_tau	 = 35	(degC)	: reference temperature 
	: Hestrin90 CA1 soma  [Mg=1 v=-40 celcius=31.5->25] The average Q10 for the rising phase was 2.2-+0.5, 
	: and that for the major fast decaying phase was 3.5-+0.9
	tp = 30			(ms)	: time of the peack -> when C + B - A reaches the maximum value or simply when NMDA has the peack current
							: tp should be recalculated when tau1 or tau2 or tau3 changes
: Parameters control desensitization of the channel
	: these values are from Fig.3 in Varela et al. 1997
	: the (1) is needed for the range limits to be effective
	d1 = 0.2 	  	(1)		< 0, 1 >     : fast depression
	tau_D1 = 2500 	(ms)	< 1e-9, 1e9 >
: Parameters Control voltage-dependent gating of NMDAR
	tauV = 7		(ms)	<1e-9,1e9>	: Kim11 
							: at 26 degC & [Mg]o = 1 mM, 
							: [Mg]o = 0 reduces value of this parameter
							: Because TauV at room temperature (20) & [Mg]o = 1 mM is 9.12 Clarke08 & Kim11 
							: and because Q10 at 26 degC is 1.52
							: then tauV at 26 degC should be 7 
	gVDst = 0.007	(1/mV)	: steepness of the gVD-V graph from Clarke08 -> 2 units / 285 mv
	gVDv0 = -100	(mV)	: Membrane potential at which there is no voltage dependent current, from Clarke08 -> -90 or -100
	gVI = 1			(uS)	: Maximum Conductance of Voltage Independent component, This value is used to calculate gVD
	Q10 = 1.52				: Kim11
	T0 = 26			(degC)	: reference temperature 
	celsius 		(degC)	: actual temperature for simulation, defined in Neuron
: Parameters Control Mg block of NMDAR
	Mg = 1			(mM)	: external magnesium concentration from Spruston95
	K0 = 4.1		(mM)	: IC50 at 0 mV from Spruston95
	delta = 0.8 	(1)		: the electrical distance of the Mg2+ binding site from the outside of the membrane from Spruston95
: The Parameter Controls Ohm law in NMDAR
	e = -0.7		(mV)	: in CA1-CA3 region = -0.7 from Spruston95

    tauAdj = 1  (1)
    gf = 1      (1)
    P_release = 1 <0,1>     : release probability (0.0 - 1.0)
}

CONSTANT {
	T = 273.16	(degC)
	F = 9.648e4	(coul)	: Faraday's constant (coulombs/mol)
	R = 8.315	(J/degC): universal gas constant (joules/mol/K)
	z = 2		(1)		: valency of Mg2+
}

ASSIGNED {
	v		(mV)
	dt		(ms)
	i		(nA)
	g		(uS)
	factor
	wf
	q10_tau2
	q10_tau3
	inf		(uS)
	tau		(ms)
    tau1    (ms)
	tau2	(ms)
	tau3	(ms)
	wtau3
    donotuse
}

STATE {
	A		: Gating in response to release of Glutamate
	B		: Gating in response to release of Glutamate
	C		: Gating in response to release of Glutamate
	gVD (uS): Voltage dependent gating
}

PROCEDURE seed(x) {
	set_seed(x)
}

INITIAL {
    if (P_release > 1) {
        P_release = 1
    } else if (P_release < 0) {
        P_release = 0
    }
	Mgblock(v)
	: temperature-sensitivity of the of NMDARs
	tau1 = tauAdj*tau1_init * Q10_tau1^((T0_tau - celsius)/10(degC))
	q10_tau2 = Q10_tau2^((T0_tau - celsius)/10(degC))
	q10_tau3 = Q10_tau3^((T0_tau - celsius)/10(degC))
	: temperature-sensitivity of the slow unblock of NMDARs
	tau  = tauAdj*tauV * Q10^((T0 - celsius)/10(degC))
	
	rates(v)
	wtau3 = 1 - wtau2
	: if tau3 >> tau2 and wtau3 << wtau2 -> Maximum conductance is determined by tau1 and tau2
	: tp = tau1*tau2*log(tau2/(wtau2*tau1))/(tau2 - tau1)
	
	factor = -exp(-tp/tau1) + wtau2*exp(-tp/tau2) + wtau3*exp(-tp/tau3)
	factor = 1/factor

	A = 0
	B = 0
	C = 0
	gVD = 0
	wf = 1
}

BREAKPOINT {
	SOLVE state METHOD derivimplicit    : Use derivimplicit for network simulations - otherwise unstable (Martynas D.)
	: we found acceptable results with "runge" integration method
	: However, M. Hines encouraged us to use "derivimplicit" method instead - which is slightly slower than runge - 
	: to avoid probable unstability problems

	i = gf*(wtau3*C + wtau2*B - A)*(gVI + gVD)*Mgblock(v)*(v - e)
}

DERIVATIVE state {
	rates(v)
	A' = -A/tau1
	B' = -B/tau2
	C' = -C/tau3
	: Voltage Dapaendent Gating of NMDA needs prior binding to Glutamate Kim11
	gVD' = ((wtau3*C + wtau2*B)/wf)*(inf-gVD)/tau
	: gVD' = (inf-gVD)/tau
}

VERBATIM
double nrn_random_pick(void* r);
void* nrn_random_arg(int argpos);
ENDVERBATIM

FUNCTION erand() {
VERBATIM
	if (_p_donotuse) {
		/*
		:Supports separate independent but reproducible streams for
		: each instance. However, the corresponding hoc Random
		: distribution MUST be set to Random.negexp(1)
		*/
		_lerand = nrn_random_pick(_p_donotuse);
	}else{
		/* only can be used in main thread */
		if (_nt != nrn_threads) {
hoc_execerror("multithread random in NetStim"," only via hoc Random");
		}
ENDVERBATIM
		: the old standby. Cannot use if reproducible parallel sim
		: independent of nhost or which host this instance is on
		: is desired, since each instance on this cpu draws fromt0
		: the same stream
		erand = nrnran123_dblpick()
VERBATIM
	}
ENDVERBATIM
}

PROCEDURE noiseFromRandom() {   : call from hoc to supply a ref to a Random() class object
                                : must have a uniform(0,1) distribution (see NEURON's documentation)
VERBATIM
 {
	void** pv = (void**)(&_p_donotuse);
	if (ifarg(1)) {
		*pv = nrn_random_arg(1);
	}else{
		*pv = (void*)0;
	}
 }
ENDVERBATIM
}

NET_RECEIVE(weight, D1, tsyn (ms), toss) {
	INITIAL {
	: these are in NET_RECEIVE to be per-stream
	: this header will appear once per stream
		D1 = 1
		tsyn = -1e9 :t
	}

    if (P_release < 1) {
        toss = erand()
    }
    if (toss <= P_release) {
        D1 = 1 - (1-D1)*exp(-(t - tsyn)/tau_D1)
        tsyn = t

        wf = weight*factor*D1
        A = A + wf
        B = B + wf
        C = C + wf

        D1 = D1 * d1
    }
}

FUNCTION Mgblock(v(mV)) {
	: from Spruston95
	Mgblock = 1 / (1 + (Mg/K0)*exp((0.001)*(-z)*delta*F*v/R/(T+celsius)))
}

PROCEDURE rates(v (mV)) {
	inf = (v - gVDv0) * gVDst * gVI
	
	tau2 = tauAdj*(tau2_0 + a2*(1-exp(-b2*v)))*q10_tau2
	tau3 = tauAdj*(tau3_0 + a3*(1-exp(-b3*v)))*q10_tau3
	if (tau1/tau2 > .9999) {
		tau1 = .9999*tau2
	}
	if (tau2/tau3 > .9999) {
		tau2 = .9999*tau3
	}
}