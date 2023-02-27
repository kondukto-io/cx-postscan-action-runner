# cx-postscan-action-runner
Helper scripts for Checkmarx post scan (executable) action to import results to Kondukto.

With this action, Checkmarx will trigger the Kondukto CLI (kdt) executable after each scan. The results XML file will be passed to the KDT as an argument, and the vulnerabilities will be mapped under the same project on Kondukto.

### How it works? 
The high-level diagram of the operation is as follows:
![How-it-works-diagram](/assets/diagram.png "How-it-works-diagram")

### Steps
- Copy the `kdt.bat` and `kdtrunner.ps1` into the Checkmarx's executables ("C:\Program Files\Checkmarx\Executables") directory.
- Copy or download the Kondukto CLI (`[kdt](https://github.com/kondukto-io/kdt)`) into the Checkmarx's executables directory.
- Edit the `kdtrunner.ps1` and add your Kondukto tenant URL and the token (You can get the token from the Kondukt UI > Integrations > Personal Access Tokens).
- Navigate to the Checkmarx UI and go to the following Post Scan Actions page: Settings > Scan Settings > Pre & Post Scan Actions and Create New Action.
- Post Scan action settings should look like below: 
![PostScanAction](/assets/postscan.png "PostScanAction")
- Once the configuration is done on the Post Scan side, please navigate to a Checkmarx project you wish to scan.
- From the Project > Advanced section, pick Run post scan action as kdt.bat:
![PickPostScan](/assets/pickpostscan.png "PickPostScan")
- Run a scan on Checkmarx and the event and the results should be reflected on Kondukto:
![KonduktoScans](/assets/kondukto_scans.png "KonduktoScans")
