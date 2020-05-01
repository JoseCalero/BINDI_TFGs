T1 = table([]);
T2 = table([]);
T3 = table([]);
T4 = table([]);
T5 = table([]);
T6 = table([]);
T7 = table([]);
T8 = table([]);
T9 = table([]);
T10 = table([]);
T11 = table([]);
T12 = table([]);
T13 = table([]);
T14 = table([]);
T15 = table([]);

%% Datos de la señal GSR por experimentos
load('GSRsignal_RQA_filtered.mat');

T1 = struct2table(data_RQA(1));
filename = 'GSRsignal_RQA_filtered.xlsx';
writetable(T1, filename, 'Sheet', 1);

T2 = struct2table(data_RQA(2));
writetable(T2, filename, 'Sheet', 2);

T3 = struct2table(data_RQA(3));
writetable(T3, filename, 'Sheet', 3);

T4 = struct2table(data_RQA(4));
writetable(T4, filename, 'Sheet', 4);

T5 = struct2table(data_RQA(5));
writetable(T5, filename, 'Sheet', 5);

T6 = struct2table(data_RQA(6));
writetable(T6, filename, 'Sheet', 6);

T7 = struct2table(data_RQA(7));
writetable(T7, filename, 'Sheet', 7);

T8 = struct2table(data_RQA(8));
writetable(T8, filename, 'Sheet', 8);

T9 = struct2table(data_RQA(9));
writetable(T9, filename, 'Sheet', 9);

T10 = struct2table(data_RQA(10));
writetable(T10, filename, 'Sheet', 10);

T11 = struct2table(data_RQA(11));
writetable(T11, filename, 'Sheet', 11);

T12 = struct2table(data_RQA(12));
writetable(T12, filename, 'Sheet', 12);

T13 = struct2table(data_RQA(13));
writetable(T13, filename, 'Sheet', 13);

T14 = struct2table(data_RQA(14));
writetable(T14, filename, 'Sheet', 14);

T15 = struct2table(data_RQA(15));
writetable(T15, filename, 'Sheet', 15);
