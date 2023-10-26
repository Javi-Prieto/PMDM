import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AgentDetails } from 'src/app/models/agent-details.interface';
import { Agent } from 'src/app/models/agent-list.interface';
import { AgentService } from 'src/app/services/agent.service';

@Component({
  selector: 'app-agent-list',
  templateUrl: './agent-list.component.html',
  styleUrls: ['./agent-list.component.css']
})
export class AgentListComponent implements OnInit{
  agentList :Agent[] = [];
  selectedAgent: AgentDetails | undefined;

  constructor(private agentService: AgentService, private modalService: NgbModal){}
  ngOnInit(): void {
    this.agentService.getListAgents().subscribe(answ => this.agentList = answ.data);
  }

  open(agentUuid: String, modal: any){
    this.agentService.getAgentByUUID(agentUuid).subscribe(agent => {
      this.selectedAgent = agent.data;
      console.log(agentUuid);
      console.log(this.selectedAgent);
      this.modalService.open(modal, {
        animation: true
      });
    });
    
  }

}
