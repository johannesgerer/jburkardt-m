function tsgWriteMatrix( filename, mat )
%
% [ mat ] = tsgWriteMatrix( filename )
%
% write a matrix to a text file
% 
% the matrix [ 1 2 3 4; 5 6 7 8; 9 10 11 12; ]
%
% is written as
%
% 3 4
% 1 2 3 4
% 5 6 7 8
% 9 10 11 12
%


fid = fopen( filename, 'w' );

fprintf( fid, ' %d  %d \n', size( mat, 1), size( mat, 2) ); % load the number of points

%format long;

Ni = size( mat, 1 );
Nj = size( mat, 2 );

fmt = [];

for i = 1:Nj
    fmt = [ fmt, '%2.20e '];
end;

fmt = [ fmt, '\n'];

for i = 1:Ni
    fprintf( fid, fmt, mat(i,:) );
end;

fclose( fid );