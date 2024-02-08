clear;

syms u1 u2
f(u1,u2) = sin(u1+u2)*sin(u2^2);
%test6.mat -> 10000 generations  % test5.mat -> 15000 generations
folder = 'C:\Users\chris\OneDrive\Έγγραφα\Github\OptimizationTechniques\OptimizationTechniques-main'; 
fullMatFileName = fullfile(folder,  'test6.mat');
if ~exist(fullMatFileName, 'file')
  message = sprintf('%s does not exist', fullMatFileName);
  uiwait(warndlg(message));
else
  s = load(fullMatFileName);
end
%12003
figure
plot(1:s.maxgenerations,s.err)
title('Best Fitness')
xlabel('Generations')
ylabel('ΜSE')
figure

nexttile
fsurf(s.best_function,[-1 2 -2 1])
xlabel('X');
ylabel('Y');
title('Αποτέλεσμα του γενετικού αλγορίθμου')

nexttile
fsurf(f,[-1 2 -2 1])
xlabel('X');
ylabel('Y');
title('Πραγματική συνάρτηση')
colorbar


figure

nexttile
fsurf(s.best_function)
xlabel('X');
ylabel('Y');
title('Αποτέλεσμα του γενετικού αλγορίθμου')

nexttile
fsurf(f)
xlabel('X');
ylabel('Y');
title('Πραγματική συνάρτηση')
colorbar



