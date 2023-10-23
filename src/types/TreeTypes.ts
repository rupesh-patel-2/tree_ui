export interface PageComponent {
    name: string,
    description: string,
    fixed_postion?:string
}

export interface TreeNode {
  id: number;
  name: string;
  children?: TreeNode[];
  components?: Array<PageComponent>
  top_component?: PageComponent,
  bottom_component?: PageComponent
}