function [fslDir] = determinePaths(parentScript,finddtiSwitch,findfslSwitch)

switch finddtiSwitch 
    case 1   
    %%add paths
    fslWait = waitbar(0.1,'Adding paths...');
    dtiSearch = findstr(parentScript,'DTI');
    dtiFolder = parentScript(1:dtiSearch(end)+2);    
    addpath(genpath(dtiFolder));
    
end

switch findfslSwitch
    case 1
        %%find FSL
        global fslDir
        if isempty(fslDir) == 1 %check if you came from a different GUI that has set the fslDir global variable
            waitbar(0.4,fslWait,'Searching for your fsl directory...');
            fslDir=getenv('FSLDIR');
            if isempty(fslDir) == 1 && exist('findFSL.m', 'file') == 2
                waitbar(0.6,fslWait,'Searching for your fsl directory...');
                fslDir = findFSL;
            end
        end
        waitbar(0.9,fslWait,'Searching for your fsl directory...');
        close(fslWait); % check if fslDir is right
        
        %%Check if fslDir is correct...throw warning if not
        options.Interpreter = 'tex'; % now present option to confirm found FSL directory...
        % Include the desired Default answer
        options.Default = 'Yes';
        % Create a TeX string for the question
        qstring = ['is this your FSL directory? ' fslDir];
        choice = questdlg(qstring,'Check Path',...
            'Yes','No',options);
        
        if strcmp(choice,'No'); % throw warning if could not find fslDir
            warnFsl = warndlg('Please specify your FSL directory within GUI. I could not find it using global, GETENV or findFSL.');
        end
end