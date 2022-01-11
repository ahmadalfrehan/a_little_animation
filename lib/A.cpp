#include<bits/stdc++.h>
using namespace std;
class E_mail
{
public:
    string SendName;
    string HistoryRecieve;
    string subject;
};
class CompWhoDateSubject
{
public:
    bool Who(string rhs,string ihs)
    {
        if(ihs<=rhs)
            return true ;
        else return false;
    }
};
class CompDateWhoSubject
{
public:

    bool Who(string rhs,string ihs)
    {
        if(ihs<=rhs)
            return true ;
        else return false;
    }
};
class CompSubjectWhoDate
{
public:
    bool Who(string rhs,string ihs)
    {
        if(ihs<=rhs)
            return true ;
        else return false;
    }
};
class MailBox:public E_mail
{
    vector<E_mail>V;
public:
    MailBox() {}
    void SortWho(string name[],string date[],string subject[],int sizee)
    {
        vector<pair<pair<string,string>,string >  >VW;
        for(int i=0; i<sizee; i++)
            VW.push_back(make_pair(make_pair(name[i],date[i]),subject[i]));
        sort(VW.begin(),VW.end());
        cout<<"Do you want to print the elements int the vector (sorting by name) ? if yes enter yes else enter no"<<endl;
        string ss;
        cin>>ss;
        if(ss=="yes")
        {
            for(int i=0; i<sizee; i++)
            {
                cout<<"the name is :"<<VW[i].first.first<<endl<<"the date is :"<<VW[i].first.second<<endl<<"the subject is :"<<VW[i].second<<endl;
            }
        }
        else cout<<"."<<endl;
    }
    void SortDate(string name[],string date[],string subject[],int sizee)
    {
        vector<pair<pair<string,string>,string >  >VD;
        for(int i=0; i<sizee; i++)
            VD.push_back(make_pair(make_pair(date[i],name[i]),subject[i]));
        sort(VD.begin(),VD.end());
        cout<<"Do you want to print the elements int the vector (sorting by date)? if yes enter yes else enter no"<<endl;
        string ss;
        cin>>ss;
        if(ss=="yes")
        {
            for(int i=0; i<sizee; i++)
            {
                cout<<"the date is :"<<VD[i].first.first<<endl<<"the name is :"<<VD[i].first.second<<endl<<"the subject is :"<<VD[i].second<<endl;
            }
        }
        else cout<<"."<<endl;
    }
    void SortSubject(string name[],string date[],string subject[],int sizee)
    {
        vector<pair<pair<string,string>,string >  >VS;
        for(int i=0; i<sizee; i++)
            VS.push_back(make_pair(make_pair(subject[i],date[i]),name[i]));
        sort(VS.begin(),VS.end());
        cout<<"Do you want to print the elements int the vector (sorting by subject) ? if yes enter yes else enter no"<<endl;
        string ss;
        cin>>ss;
        if(ss=="yes")
        {
            for(int i=0; i<sizee; i++)
            {
                cout<<"the subject is :"<<VS[i].first.first<<endl<<"the date is :"<<VS[i].first.second<<endl<<"the name is :"<<VS[i].second<<endl;
            }
        }
        else cout<<"."<<endl;
    }
};
int main()
{
    CompDateWhoSubject CDWS;
    CompSubjectWhoDate CSWD;
    CompWhoDateSubject CWDS;
    if(CWDS.Who("",""))
    {
        if(CDWS.Who("",""))
        {
            if(CSWD.Who("",""))
            {

            }
        }
    }
    string aname[5];
    string adate[5];
    string asubject[5];
    cout<<"enter five msg"<<endl;
    for(int i=0; i<5; i++)
    {
        //
        cout<<"enter the name and date and the subject of it "<<i+1<<endl;
        cin>>aname[i]>>adate[i]>>asubject[i];
    }
    MailBox M;
    M.SortDate(aname,adate,asubject,5);
    M.SortSubject(aname,adate,asubject,5);
    M.SortWho(aname,adate,asubject,5);
    return 0;
}
