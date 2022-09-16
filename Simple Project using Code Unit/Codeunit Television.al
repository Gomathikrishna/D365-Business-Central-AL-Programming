codeunit 50140 "Television Test"
{
    Subtype = Test;

    trigger OnRun()
    begin
    end;

    [Test]
    procedure CreateTelevisionShows()
    begin
        HelperCreateTelevisionShow('TS001', 'TALK', 'Talk of the Town', 020000T - 000000T, 'CECE', 'CeCe');
        HelperCreateTelevisionShow('TS002', 'TALENT', 'Singer of the Year', 020000T - 000000T, 'ALEC', 'Alec');
        HelperCreateTelevisionShow('TS003', 'LIVE', 'Seasonal Chef', 020000T - 000000T, 'Cole', 'Cole');
        HelperCreateTelevisionShow('TS004', 'LIVE', 'Your Voice Your Rights', 020000T - 000000T, 'WESLEY', 'Wesley');
        HelperCreateTelevisionShow('TS005', 'TALENT', 'Young Talents', 020000T - 000000T, 'SASKIA', 'Saskia');
        HelperCreateTelevisionShow('TS006', 'NEWS', 'News 365', 020000T - 000000T, 'DAAN', 'Daan');
        HelperCreateTelevisionShow('TS007', 'ROCK', 'Dance for Cause', 020000T - 000000T, 'JOSEPH', 'Josephine');
        HelperCreateTelevisionShow('TS008', 'TALENT', 'Genius Kids', 020000T - 000000T, 'KRISTAL', 'Kristel');
    end;

    [Test]
    procedure CreateTelevisionShowType()
    begin
        HelperCreateShowType('TALENT', 'Carnatic Music');
        HelperCreateShowType('LIVE', 'Coffee with Dad');
        HelperCreateShowType('TALK', 'Voice out');
        HelperCreateShowType('NEWS', 'In-depth Stories');
        HelperCreateShowType('ROCK', 'Sweet 70');
    end;

    [Test]
    procedure CreateFan()
    begin
        HelperCreateFan('FAN01', 'TS002', 'Lakshmi', 'lakshmi1987@krishna.com', WorkDate);
        HelperCreateFan('FAN02', 'TS002', 'Ramya Srini', 'ramyasrini@radhe.com', WorkDate);
    end;

    [Test]
    procedure CreatePlayList()
    begin
        HelperCreatePlaylistHeader('221', 'TS001', 'Talk of the Town', WorkDate, 100000T, 120000T);
        HelperCreatePlaylistHeader('222', 'TS002', 'Singer of the Year', WorkDate, 120000T, 140000T);
        HelperCreatePlaylistHeader('223', 'TS003', 'Seasonal Chef', WorkDate, 140000T, 150000T);
        HelperCreatePlaylistHeader('224', 'TS004', 'Your Voice Your Rights', WorkDate, 150000T, 160000T);
        HelperCreatePlaylistHeader('225', 'TS005', 'Young Talents', WorkDate, 160000T, 180000T);
        HelperCreatePlaylistHeader('226', 'TS006', 'News 365', WorkDate, 180000T, 190000T);
        HelperCreatePlaylistHeader('227', 'TS007', 'Dance for Cause', WorkDate, 190000T, 200000T);
        HelperCreatePlaylistHeader('228', 'TS008', 'Genius Kids', WorkDate, 200000T, 220000T);
    end;

    [Test]
    procedure TestTelevisionShows()
    begin
    end;

    procedure HelperCreateTelevisionShow(No: Code[20]; ShowCode: Code[10]; Name: Text; RunTime: Duration; HostCode: Code[10]; HostName: Text)
    var
        TelevisionShow: Record "Television Show";
    begin
        TelevisionShow."No." := No;
        TelevisionShow."Television Show Type" := ShowCode;
        TelevisionShow.Name := Name;
        TelevisionShow."Run Time" := RunTime;
        TelevisionShow."Host Code" := HostCode;
        TelevisionShow."Host Name" := HostName;
        TelevisionShow.Insert;
    end;

    procedure HelperCreateShowType("Code": Code[10]; Descr: Text)
    var
        TelevisionShowType: Record "Television Show Type";
    begin
        TelevisionShowType.Code := Code;
        TelevisionShowType.Description := Descr;
        TelevisionShowType.Insert;
    end;

    procedure HelperCreateFan(No: Code[20]; TelevisionShowNo: Code[20]; Name: Text; Email: Text; LastContact: Date)
    var
        TelevisionShowFan: Record "Television Show Fan";
    begin
        TelevisionShowFan."No." := No;
        TelevisionShowFan."Television Show No." := TelevisionShowNo;
        TelevisionShowFan.Name := Name;
        TelevisionShowFan."E-Mail" := Email;
        TelevisionShowFan."Last Contacted" := LastContact;
        TelevisionShowFan.Insert;
    end;

    procedure HelperCreatePlaylistHeader(No: Code[20]; TelevisionShowNo: Code[20]; Descr: Text; BroadCastDate: Date; StartTime: Time; EndTime: Time)
    var
        PlaylistHeader: Record "Playlist Header";
    begin
        with PlaylistHeader do begin
            "No." := No;
            "Television Show No." := TelevisionShowNo;
            Description := Descr;
            "Broadcast Date" := BroadCastDate;
            "Start Time" := StartTime;
            "End Time" := EndTime;
            Duration := EndTime - StartTime;
            Insert;
        end;
    end;
}


