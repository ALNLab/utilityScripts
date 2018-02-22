%This script will find FSL directory if it's in your applications or user folder...

%Alex Teghipco
%ateghipc@u.rochester.edu
%April 22 2016

function [FSLDIR] = findFSL
[one,two]=system('find /Applications -iname "*fsl*"');
Key='/Applications/';
Index = strfind(two, Key);
if isempty(Index) == 1
    [one,two]=system('find /Users -iname "*fsl*"');
    Key='/Applications/';
    Index = strfind(two, Key);
end
FSLDIR=two(Index(1):Index(2)-2);

