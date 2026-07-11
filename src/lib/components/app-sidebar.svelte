<script lang="ts">
  import CalendarIcon from '@lucide/svelte/icons/calendar';
  import HouseIcon from '@lucide/svelte/icons/house';
  import InboxIcon from '@lucide/svelte/icons/inbox';
  import SearchIcon from '@lucide/svelte/icons/search';
  import SettingsIcon from '@lucide/svelte/icons/settings';
  import Building2 from '@lucide/svelte/icons/building-2';
  import MapPin from '@lucide/svelte/icons/map-pin';
  import Code from '@lucide/svelte/icons/code';
  import * as Sidebar from '$lib/components/ui/sidebar/index.js';
  import * as Avatar from '$lib/components/ui/avatar/index.js';

  import { resolve } from '$app/paths';
  import Separator from './ui/separator/separator.svelte';

  // Menu items.
  const items = [
    { title: 'About', url: '/#about', icon: HouseIcon },
    { title: 'Experience', url: '/#experience', icon: InboxIcon },
    { title: 'Projects', url: '/#projects', icon: CalendarIcon },
    { title: 'Reading', url: '/#reading', icon: SearchIcon },
    { title: 'Contact', url: '/#contact', icon: SettingsIcon }
  ] as const;
</script>

<Sidebar.Root collapsible="offcanvas">
  <Sidebar.Header class="p-4">
    <div class="flex items-center gap-3">
      <Avatar.Root class="size-28">
        <Avatar.Image src="https://github.com/betosardinha.png" alt="@betosardinha" />
        <Avatar.Fallback>BS</Avatar.Fallback>
      </Avatar.Root>
      <span class="text-4xl font-semibold">Beto Sardinha</span>
    </div>

    <p class="wrap-break-word text-muted-foreground">
      Backend-focused, with occasional frontend work. I like building reliable APIs and testing the
      hell out of systems.
    </p>

    <span class="flex items-center gap-3 text-sm text-muted-foreground">
      <Building2 /> Backend Engineer - Justifi
    </span>
    <span class="flex items-center gap-3 text-sm text-muted-foreground">
      <Code /> Ruby on Rails, Go, Postgres
    </span>
    <span class="flex items-center gap-3 text-sm text-muted-foreground">
      <MapPin /> São José dos Campos - Brazil
    </span>

    <Separator />
  </Sidebar.Header>

  <Sidebar.Content>
    <Sidebar.Group>
      <Sidebar.GroupContent>
        <Sidebar.Menu>
          {#each items as item (item.title)}
            <Sidebar.MenuItem>
              <Sidebar.MenuButton class="text-base [&>svg]:size-6">
                {#snippet child({ props })}
                  <a href={resolve(item.url)} {...props}>
                    <item.icon />
                    <span>{item.title}</span>
                  </a>
                {/snippet}
              </Sidebar.MenuButton>
            </Sidebar.MenuItem>
          {/each}
        </Sidebar.Menu>
      </Sidebar.GroupContent>
    </Sidebar.Group>
  </Sidebar.Content>
</Sidebar.Root>
