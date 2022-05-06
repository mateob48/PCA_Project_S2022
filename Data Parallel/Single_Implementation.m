% Single core implementation

clear
close all
clc

TimeBWF = cell(1,5);
TimeVF = cell(1,5);
SequenceF = cell(1,5);

for i = 1
    Exp = i;
    Hidd = 4;
    [TimeBW,TimeV,Sequence] = Single_Core_Experiment(Exp, Hidd);

    TimeBWF{i} = TimeBW;
    TimeVF{i} = TimeV;
    SequenceF{i} = Sequence;
end

