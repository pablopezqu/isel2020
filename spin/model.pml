ltl sample { [] <> next_sample -> [] <> sample_start }
ltl send { [] <> next_send -> [] <> send_start }

int sample_start = 0
int send_start = 0

int temp = 0
int entorno_temp = 0

int state_sample = 0
int next_sample = 0

int state_send = 0
int next_send = 0

active proctype FSMsample() {
	state_sample = 0;
	do
	:: (state_sample == 0) -> atomic {
		if
		:: next_sample -> next_sample = 0; sample_start = 1; printf("muestrea()\n"); temp = entorno_temp
		fi
	}
	od
}

active proctype FSMsend() {
	state_send = 0;
	do
	:: (state_send == 0) -> atomic {
		if
		:: next_send -> next_send = 0; send_start = 1; printf("send(%d)\n", temp)
		fi
	}
	od
}

active proctype entorno() {
	do
	:: if
	   :: next_sample = 1
	   :: next_send = 1
	   :: entorno_temp = 3
	   :: entorno_temp = 4
	   :: entorno_temp = 5
	   :: entorno_temp = 6
	   :: sample_start -> sample_start = 0
	   :: send_start -> send_start = 0
	   :: (next_sample == 0) -> skip
	   fi;
	   printf ("next_sample = %d, next_send = %d \n", next_sample, next_send)
	od
}
