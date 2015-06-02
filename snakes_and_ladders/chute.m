%% CHUTE  Chutes and ladders analysis.
%
%  Discussion:
%
%    This script determines the probability of finishing a one-player
%    game of chutes and ladders in exactly N moves (PDF) or in no more 
%    than N moves (CDF).

%
%    The game starts at square 0, and ends when square 100 is reached.
%
%  Modified:
%
%    19 September 2014
%
%  Author:

%

%    Desmond Higham, Nicholas Higham

%

%  Reference:

%

%    Desmond Higham, Nicholas Higham,

%    MATLAB Guide,

%    SIAM, 2005,

%    ISBN13: 9780898717891.

%
  N = 100;
%
% "+1" translates square to state.
%
  top = [ 1  4  9 16 21 28 36 47 49 51 56 62 64 71 80  87 93 95 98] + 1;
  bot = [38 14 31  6 42 84 44 26 11 67 53 19 60 91 100 24 73 75 78] + 1;

  P = toeplitz(zeros(1,N+1),[0 ones(1,6) zeros(1,N-6)]);

  for k = N-4:N+1
    P(k,k) = k-N+5;
  end
  P = P/6;

  for k = 1:length(top)
    r = top(k); s = bot(k);     % Chute or ladder from r to s.
    P(:,s) = P(:,s) + P(:,r);   % Add column r to column s.
  end
  P(top,:) = [];
  P(:,top) = [];  % Remove starts of chutes and ladders.

  figure(1)
  spy(P)

  M = 200;
  cumprob = zeros(M,1);
  cumprob(1) = P(1,end);
  v = P(1,:);
  for n = 2:M,
    v = v*P;
    cumprob(n) = v(end);
  end

  figure(2)
  colormap([0.8,0.4,0.4])
  bar(diff([0;cumprob]))
  title('Probability for Game Length','FontSize',12,'FontWeight','Bold')
  grid on
  xlim([0 M])

 
figure(3)
 
colormap([0.8,0.4,0.4])
  bar(cumprob)
  title('Cumulative Probability for Game Length',...
      'FontSize',12,'FontWeight','Bold')
  grid on
  xlim([0 M])
